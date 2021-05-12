package com.example.datadamoa;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class WorkActivity extends AppCompatActivity {

    WebView webview;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_work);

        Intent intent = this.getIntent();
        int board_idx = intent.getIntExtra("board_idx", 1);

        webview = (WebView) findViewById(R.id.work_webview);
        webview.setWebViewClient(new WebViewClient());
        webview.getSettings().setJavaScriptEnabled(true);

//        Log.d("OpenURL", "http://capstone.louissoft.kr:3000/view_board/?board_idx=" + board_idx);
        webview.loadUrl("http://capstone.louissoft.kr:3000/view_board/?board_idx=" + board_idx);
    }
}