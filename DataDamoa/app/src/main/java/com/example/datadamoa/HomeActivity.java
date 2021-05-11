package com.example.datadamoa;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.Buffer;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;

public class HomeActivity extends AppCompatActivity {
//    TextView btn1;

    Button btTest;
    WorkListView lv;
    ArrayList<Work> arrWork = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        lv = (WorkListView)findViewById(R.id.home_listview);
        getBoardList();

        Log.d("getBoardList Start", "finish");


    }

    // http://capstone.louissoft.kr:3000/search/api/all

    void getBoardList() {
        new Thread() {
            @Override
            public void run() {
                String serverUri = "http://capstone.louissoft.kr:3000/search/api/all/";
                try {
                    Log.d("getBoardList Start", "Start2");
                    URL url = new URL(serverUri);
                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("GET");
//                    connection.setDoOutput(true);
                    connection.setDoInput(true);
                    Log.d("getBoardList", "hi2");

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

                            for(int i = 0; i < ja.length(); i++) {
                                Work w = new Work();
                                w.idx = Integer.parseInt(ja.getJSONObject(i).getString("idx"));
                                w.title = ja.getJSONObject(i).getString("title");;
                                w.price = Integer.parseInt(ja.getJSONObject(i).getString("price"));
                                arrWork.add(w);
                            }

                            for(int i = 0; i < arrWork.size(); i++) {
                                Log.d("workList", arrWork.get(i).title);

                            }

                            homeViewAdapter hAdapter = new homeViewAdapter(arrWork);
                            lv.setAdapter(hAdapter);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

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