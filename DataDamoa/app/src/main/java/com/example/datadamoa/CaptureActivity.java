package com.example.datadamoa;

import static java.security.AccessController.getContext;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.Manifest;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.theartofdev.edmodo.cropper.CropImage;
import com.theartofdev.edmodo.cropper.CropImageView;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class CaptureActivity extends AppCompatActivity {

    CropImageView cropImageView;
    Button bt;
    Bitmap uploadImg;
    int board_idx, x, y, width, height;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_capture);

        Intent intent = this.getIntent();
        board_idx = intent.getIntExtra("board_idx", 0);

        cropImageView = (CropImageView)findViewById(R.id.cropImageView);
        bt = (Button)findViewById(R.id.button);

        bt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Rect resRect = cropImageView.getCropRect();
                x = resRect.left;
                y = resRect.top;
                width = resRect.right - resRect.left;
                height = resRect.bottom - resRect.top;
                Log.d("Rect", resRect.top + "," + resRect.left + ","  + resRect.bottom + "," + resRect.right);
                new Thread() {
                    @Override
                    public void run() {
                        sendUpload();
                    }
                }.start();

            }
        });

        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if(checkSelfPermission(Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED &&
                    checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) {
                Log.d("TAG", "권한 설정 완료");
            }
            else {
                Log.d("TAG", "권한 설정 요청");
                ActivityCompat.requestPermissions(CaptureActivity.this, new String[]{
                        Manifest.permission.CAMERA, Manifest.permission.WRITE_EXTERNAL_STORAGE
                }, 1);
            }
        }

        Intent cameraIntent = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
        startActivityForResult(cameraIntent, 1);

    }

    void sendUpload() {

        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        SharedPreferences sf = getSharedPreferences("cookie",MODE_PRIVATE);
        MediaType mediaType = MediaType.parse("text/plain");
        RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
                .addFormDataPart("x",x + "")
                .addFormDataPart("y",y + "")
                .addFormDataPart("width",width + "")
                .addFormDataPart("height",height + "")
                .addFormDataPart("work_board_idx",board_idx+"")
                .addFormDataPart("imgFile","temp.jpg",
                        RequestBody.create(MediaType.parse("application/octet-stream"),
                                saveBitmapToJpeg(uploadImg, "temp.jpg")))
                .build();
        Request request = new Request.Builder()
                .url("http://capstone.louissoft.kr:3000/view_board/upload")
                .method("POST", body)
                .addHeader("Cookie", sf.getString("cookie", ""))
                .build();
        try {
            Response response = client.newCall(request).execute();
            if(response.body().string().equals("upload success.")) {
                // 업로드 완료
                CaptureActivity.this.runOnUiThread(new Runnable() {
                    public void run() {
                        Toast.makeText(CaptureActivity.this, "업로드 성공", Toast.LENGTH_SHORT).show();
                        finish();
                    }
                });
            }
            else {
                // 실패
                CaptureActivity.this.runOnUiThread(new Runnable() {
                    public void run() {
                        AlertDialog alertDialog = new AlertDialog.Builder(CaptureActivity.this).create();
                        alertDialog.setTitle("업로드 실패");
                        alertDialog.setMessage("업로드에 실패하였습니다. 관리자에게 문의하여 주십시오.");
                        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "확인",
                                new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.dismiss();
                                    }
                                });
                        alertDialog.show();
                    }
                });
            }



        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private File saveBitmapToJpeg(Bitmap bitmap, String name) {
        File storage = getCacheDir();
        String fileName = name + ".jpg";
        File tempFile = new File(storage, fileName);

        try {
            tempFile.createNewFile();
            FileOutputStream out = new FileOutputStream(tempFile);
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, out);
            out.close();
            return tempFile;

        } catch (FileNotFoundException e) {
            Log.e("MyTag","FileNotFoundException : " + e.getMessage());
            return null;
        } catch (IOException e) {
            Log.e("MyTag","IOException : " + e.getMessage());
            return null;
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);
        switch (requestCode) {
            case 1:
                if (resultCode == RESULT_OK && intent.hasExtra("data")) {
                    Bitmap bitmap = (Bitmap) intent.getExtras().get("data");
                    if(bitmap != null) {
                        uploadImg = bitmap;
                        cropImageView.setImageBitmap(bitmap);
                    }
                }
                break;

        }
    }
}