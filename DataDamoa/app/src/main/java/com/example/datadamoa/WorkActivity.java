package com.example.datadamoa;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.CookieManager;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import java.util.HashMap;
import java.util.Map;

public class WorkActivity extends AppCompatActivity {

    WebView webview;
    Map<String, String> extraHeaders = new HashMap<String, String>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_work);

        Intent intent = this.getIntent();
        int board_idx = intent.getIntExtra("board_idx", 1);

        webview = (WebView) findViewById(R.id.work_webview);
        CookieManager.getInstance().setAcceptCookie(true);

        SharedPreferences sharedPreferences = getSharedPreferences("cookie",MODE_PRIVATE);
        String cookie = sharedPreferences.getString("cookie", "no-cookie");

        Log.d("Cookie", cookie);
        Log.d("WorkActivity", "WorkActivity load");

        extraHeaders.put("Cookie", cookie);

        webview.setWebViewClient(new WebViewClient(){
            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                HideHeader(webview);
            }

            public boolean shouldOverrideUrlLoading(WebView view, String url){
                view.loadUrl(url, extraHeaders);
                Log.d("extraHeader", extraHeaders.toString());
                return false;
            }
        });
        webview.getSettings().setJavaScriptEnabled(true);

        webview.loadUrl("http://capstone.louissoft.kr:3000/view_board/?board_idx=" + board_idx, extraHeaders);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle presses on the action bar items
        switch (item.getItemId()) {
            case R.id.action_upload_photo:
                Log.d("WorkActivity", "Upload photo click");
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    public void HideHeader(WebView wv){

        try{
            wv.loadUrl(
                    "javascript:(function() { " +
                            "document.getElementById('menubar').style.display = 'none'; " +
                            "document.getElementById('main').style.paddingTop = '0';" +
                            "})()"
            );
        }catch (Exception e){}

    }
}