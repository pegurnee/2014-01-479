package com.example.cardscheckbox;

import android.annotation.TargetApi;
import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.ImageView;

@TargetApi(Build.VERSION_CODES.JELLY_BEAN) public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        ((CheckBox)this.findViewById(R.id.c_chbx)).setOnCheckedChangeListener(new CheckBoxListener());
        ((CheckBox)this.findViewById(R.id.d_chbx)).setOnCheckedChangeListener(new CheckBoxListener());
        ((CheckBox)this.findViewById(R.id.h_chbx)).setOnCheckedChangeListener(new CheckBoxListener());
        ((CheckBox)this.findViewById(R.id.s_chbx)).setOnCheckedChangeListener(new CheckBoxListener());
        
        this.findViewById(R.id.hide_btn).setOnClickListener(new ButtonListener());
        this.findViewById(R.id.show_btn).setOnClickListener(new ButtonListener());
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
    private class CheckBoxListener implements OnCheckedChangeListener {

		@Override
		public void onCheckedChanged(CompoundButton theBox,
				boolean isChecked) {
			switch (theBox.getId()) {
			case R.id.c_chbx:
				((ImageView)MainActivity.this.findViewById(R.id.c_img)).setImageAlpha(isChecked ? 255 : 76);
				break;
			case R.id.d_chbx:
				((ImageView)MainActivity.this.findViewById(R.id.d_img)).setImageAlpha(isChecked ? 255 : 76);
				break;
			case R.id.h_chbx:
				((ImageView)MainActivity.this.findViewById(R.id.h_img)).setImageAlpha(isChecked ? 255 : 76);
				break;
			case R.id.s_chbx:
				((ImageView)MainActivity.this.findViewById(R.id.s_img)).setImageAlpha(isChecked ? 255 : 76);
				break;
			}
		}
    	
    }
    
    private class ButtonListener implements OnClickListener {

		@Override
		public void onClick(View v) {
			if (v.getId() == R.id.hide_btn) {
				((ImageView)MainActivity.this.findViewById(R.id.c_img)).setImageAlpha(76);
				((ImageView)MainActivity.this.findViewById(R.id.d_img)).setImageAlpha(76);
				((ImageView)MainActivity.this.findViewById(R.id.h_img)).setImageAlpha(76);
				((ImageView)MainActivity.this.findViewById(R.id.s_img)).setImageAlpha(76);
			} else {
				((ImageView)MainActivity.this.findViewById(R.id.c_img)).setImageAlpha(255);
				((ImageView)MainActivity.this.findViewById(R.id.d_img)).setImageAlpha(255);
				((ImageView)MainActivity.this.findViewById(R.id.h_img)).setImageAlpha(255);
				((ImageView)MainActivity.this.findViewById(R.id.s_img)).setImageAlpha(255);
			}
			
		}
    	
    }
    
}
