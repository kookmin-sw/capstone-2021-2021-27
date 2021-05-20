package com.example.datadamoa;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class MainActivity extends AppCompatActivity {

    EditText etID, etPW;
    Button btLogin;
    Context context;
    SharedPreferences appData;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        context = this.getApplicationContext();

        etID = (EditText) findViewById(R.id.et_id);
        etPW = (EditText) findViewById(R.id.et_pw);
        btLogin = (Button)findViewById(R.id.bt_Login);

        // 로그인 버튼을 클릭했을 경우
        btLogin.setOnClickListener(new Button.OnClickListener(){
            @Override
            public void onClick(View v) {
                String id = etID.getText().toString().trim();
                String pw = etPW.getText().toString().trim();

                // 로그인 함수를 실행한다.
                login(id, pw);
            }
        });

    }


    void login(String id, String pw) {
        new Thread() {
            public void run() {
                try {
                    URL url = new URL("http://capstone.louissoft.kr:3000/login");
                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("POST");
                    connection.setDoInput(true);
                    connection.setDoOutput(true);
                    connection.setRequestProperty("content-type", "application/x-www-form-urlencoded");

                    StringBuffer buffer = new StringBuffer();
                    buffer.append("id").append("=").append(id).append("&");
                    buffer.append("password").append("=").append(pw);

                    Log.d("loginQuery", buffer.toString());

                    OutputStreamWriter outStream = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
                    PrintWriter writer = new PrintWriter(outStream);
                    writer.write(buffer.toString());
                    writer.flush();
                    Log.d("status", "login send");

                    String cookie = connection.getHeaderField("Set-Cookie");

                    InputStream is = connection.getInputStream();
                    StringBuilder sb = new StringBuilder();
                    BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                    String result;
                    while ((result = br.readLine()) != null) {
                        sb.append(result + "\n");
                    }
                    result = sb.toString();
                    boolean success = false;
                    if(result.contains("아이디 또는") == false)
                        success = true;

                    // 로그인 성공
                    if(success) {
                        Intent intent = new Intent(getApplicationContext(), HomeActivity.class);
                        SharedPreferences sf = getSharedPreferences("cookie",MODE_PRIVATE);
                        SharedPreferences.Editor editor = sf.edit();
                        editor.putString("cookie",cookie);
                        editor.commit();
                        startActivity(intent);
                        finish();
                    }
                    // 로그인 실패
                    else {
                        MainActivity.this.runOnUiThread(new Runnable() {
                            public void run() {
                                AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this).create();
                                alertDialog.setTitle("로그인 실패");
                                alertDialog.setMessage("로그인에 실패하였습니다. 아이디 또는 비밀번호를 확인해 주십시오.");
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
                }
                catch (MalformedURLException e) {
                    //
                } catch (IOException e) {
                    //
                }
            }
        }.start();
    }
}