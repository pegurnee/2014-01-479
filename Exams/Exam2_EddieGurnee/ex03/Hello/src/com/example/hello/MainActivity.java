package com.example.hello;

import android.os.Bundle;
import android.app.Activity;
import android.graphics.Color;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity implements OnClickListener {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		Button button = (Button) findViewById(R.id.button1);
		button.setOnClickListener(this);
		
/*		Button button = (Button) findViewById(R.id.button1);
		button.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View view) {
				EditText myInput =(EditText)findViewById(R.id.editText1);
				TextView myOutput =(TextView)findViewById(R.id.textView2);
				myOutput.setText(myInput.getText());
				
			}
		});
*/

		EditText myInput =(EditText)findViewById(R.id.editText1);
		myInput.addTextChangedListener(new TextWatcher() {

			@Override
		    public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
		 
		    }
		 
		    @Override
		    public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

		    }
		 
		    @Override
		    public void afterTextChanged(Editable editable) {
		 
		    }
		});

	
	}
	
	// The type MainActivity must implement the inherited abstract method View.OnClickListener.onClick(View)
	@Override
	public void onClick(View v) {   
		EditText myInput =(EditText)findViewById(R.id.editText1);
		TextView myOutput =(TextView)findViewById(R.id.textView2);
		myOutput.setText(myInput.getText());
		myOutput.setTextColor(Color.BLUE);
		myOutput.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
		myOutput.setTextSize(48.0f);
	}	

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
	
/*	public void DoTheButton(View v) {
		EditText myInput =(EditText)findViewById(R.id.editText1);
		TextView myOutput =(TextView)findViewById(R.id.textView2);
		myOutput.setText(myInput.getText());
	}
*/
}
