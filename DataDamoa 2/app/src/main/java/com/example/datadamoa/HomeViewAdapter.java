package com.example.datadamoa;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class HomeViewAdapter  extends BaseAdapter {
    LayoutInflater inflater = null;
    private ArrayList<Work> boardList = null;
    private int boardListCnt = 0;

    public HomeViewAdapter(ArrayList<Work> _data){
        boardList = _data;
        boardListCnt = boardList.size();
        Log.d("homeviewadapter", boardListCnt + "");
    }

    public void refreshData(ArrayList<Work> _data) {
        boardList = _data;
        boardListCnt = boardList.size();
    }

    @Override
    public int getCount() {
        return boardListCnt;
    }

    @Override
    public Object getItem(int position) {
        return boardList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (convertView == null)
        {
            final Context context = parent.getContext();
            if (inflater == null)
            {
                inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            }
            convertView = inflater.inflate(R.layout.work_item, parent, false);
        }


        TextView tvTitle = (TextView) convertView.findViewById(R.id.work_title);
        TextView tvPrice = (TextView) convertView.findViewById(R.id.work_price);

        tvTitle.setText(boardList.get(position).title);
        tvPrice.setText(String.format("%d 원", boardList.get(position).price));


        return convertView;
    }
}
