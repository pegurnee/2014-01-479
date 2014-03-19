package com.example.bytheway;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
    
    public void guessFool(View v) {
    	EditText input = (EditText) findViewById(R.id.input_txtbx);
    	TextView output = (TextView) this.findViewById(R.id.result_lbl);
    	String theInput = input.getText().toString();
    	if (theInput.equals("katamari")) {
    		output.setText("NA NA NA NA NANA NA NA!!");
    	} else {
        	output.setText(input.getText());
    	}
    }
    
    
}
