package com.example.datadamoa;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.bumptech.glide.Glide;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class CashboardActivity extends AppCompatActivity {

    TextView tvcash, tvavailcash, tvdealcash, tvwdcash;

    @Override
    protected void onCreate(Bundle saveInstanceState) {
        super.onCreate(saveInstanceState);
        setContentView(R.layout.activity_cashboard2);

        tvcash = (TextView)findViewById(R.id.totalcash);
        tvavailcash = (TextView)findViewById(R.id.availcash);
        tvdealcash = (TextView)findViewById(R.id.dealcash);
        tvwdcash = (TextView)findViewById(R.id.wdcash);

        getCashInfo();
    }
    void getCashInfo(){
        new Thread(){
            @Override
            public void run(){
                String serverUri = "http://capstone.louissoft.kr:3000/cash_board/api";
                try {
                    Log.d("getcashboard", "Start1");
                    URL url = new URL(serverUri);
                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("GET");
//                    connection.setDoOutput(true);
                    SharedPreferences sf = getSharedPreferences("cookie",MODE_PRIVATE);
                    connection.setRequestProperty("content-type", "application/x-www-form-urlencoded");
                    connection.setRequestProperty("Cookie", sf.getString("cookie", ""));
                    connection.setDoInput(true);
                    Log.d("getcashBoard", "start2");

                    if(connection.getResponseCode() == HttpURLConnection.HTTP_OK){
                        InputStreamReader isr = new InputStreamReader(connection.getInputStream());
                        BufferedReader br = new BufferedReader(isr);
                        final StringBuffer buffer = new StringBuffer();
                        String line = br.readLine();
                        while (true){
                            if(line== null){
                                break;
                            }
                            buffer.append(line);
                            line = br.readLine();
                        }
                        Log.d("result", buffer.toString());

                        try {
                            JSONArray ja = new JSONArray(buffer.toString());

                            int TotalKRW = Integer.parseInt(ja.getJSONObject(0).getString("TotalKRW"));
                            int Withdraw_KRW = Integer.parseInt(ja.getJSONObject(0).getString("Withdraw_KRW"));
                            int Worked_KRW = Integer.parseInt(ja.getJSONObject(0).getString("Worked_KRW"));
                            int Available_KRW = Integer.parseInt(ja.getJSONObject(0).getString("Available_KRW"));

                            runOnUiThread(new Runnable() {
                                @Override
                                public void run() {
                                    // 이 곳에 UI작업을 한다
                                    tvcash.setText( TotalKRW +" ");
                                    tvwdcash.setText(Withdraw_KRW+" ");
                                    tvdealcash.setText(Worked_KRW+" ");
                                    tvavailcash.setText(Available_KRW+" ");

                                }
                            });



                        }
                        catch (JSONException e) {
                            e.printStackTrace();
                        }
//
                    }

                }
                catch (MalformedURLException e) {
                    //
                    Log.d("getBoadListError", e.toString());
                } catch (IOException e) {
                    //
                    Log.d("getBoadListError", e.toString());
                }
            }
        }.start();
    }


}
