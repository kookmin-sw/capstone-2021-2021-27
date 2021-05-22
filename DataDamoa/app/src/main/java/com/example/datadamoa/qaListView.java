package com.example.datadamoa;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ListView;

public class qaListView extends ListView {
    public qaListView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public qaListView(Context context) {
        super(context);
    }

    public qaListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    // 사이즈를 유동적이게 리스트뷰를 설정한다.
    @Override
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int expandSpec = View.MeasureSpec.makeMeasureSpec(Integer.MAX_VALUE >> 2,
                View.MeasureSpec.AT_MOST);
        super.onMeasure(widthMeasureSpec, expandSpec);
    }

}
