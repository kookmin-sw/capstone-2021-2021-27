package com.example.datadamoa;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class qaViewAdapter extends BaseAdapter {
    LayoutInflater inflater = null;
    private ArrayList<qaWork> qaList = null;
    private int qaListCnt = 0;

    public qaViewAdapter(ArrayList<qaWork> _data){
        qaList = _data;
        qaListCnt = qaList.size();
        Log.d("qaViewAdapter", qaListCnt+"");
    }

    public void refreshData(ArrayList<qaWork> _data) {
        qaList = _data;
        qaListCnt = qaList.size();
    }
    @Override
    public int getCount() {
        return qaListCnt;
    }

    @Override
    public Object getItem(int position) {
        return qaList.get(position);
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
            convertView = inflater.inflate(R.layout.activity_qa, parent, false);
        }


        TextView tvqanick = (TextView) convertView.findViewById(R.id.qanick);
        TextView tvquestion = (TextView) convertView.findViewById(R.id.q);
        TextView tvanswer = (TextView) convertView.findViewById(R.id.a);

        tvqanick.setText(qaList.get(position).questNick);
        tvquestion.setText(qaList.get(position).question);
        if(qaList.get(position).answer.equals("null")) {
            qaList.get(position).answer = "답변 대기중인 질문입니다.";
        }
        tvanswer.setText(qaList.get(position).answer);
        return convertView;
    }

}
