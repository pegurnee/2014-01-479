package com.example.hello;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity implements OnClickListener {

	private final int N_BTNS = 6;
	private Button[] theBtns = new Button[6];
	private int[] ids = { R.id.red, R.id.green, R.id.blue, R.id.brown,
			R.id.purple, R.id.orange };
	private int[] colors = { Color.RED, Color.GREEN, Color.BLUE,
			Color.rgb(102, 51, 0), Color.rgb(127, 0, 255),
			Color.rgb(255, 128, 0) };
	private final String[] color_names = { "Red", "Green", "Blue", "Brown",
			"Purple", "Orange" };
	private View theView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		this.theView = this.getCurrentFocus();
		for (int i = 0; i < this.N_BTNS; i++) {
			this.theBtns[i] = (Button) findViewById(this.ids[i]);
			this.theBtns[i].setOnClickListener(this);
			this.theBtns[i].setBackgroundColor(this.colors[i]);
			this.theBtns[i].setText(this.color_names[i]);
		}

		/*
		 * Button button = (Button) findViewById(R.id.button1);
		 * button.setOnClickListener(new OnClickListener() {
		 * 
		 * @Override public void onClick(View view) { EditText myInput
		 * =(EditText)findViewById(R.id.editText1); TextView myOutput
		 * =(TextView)findViewById(R.id.textView2);
		 * myOutput.setText(myInput.getText());
		 * 
		 * } });
		 */
	}

	// The type MainActivity must implement the inherited abstract method
	// View.OnClickListener.onClick(View)
	@Override
	public void onClick(View v) {
		int i;
		for (i = 0; i < this.N_BTNS; i++) {
			if (v.getId() == this.ids[i]) {
				break;
			}
		}
		
		View someView = findViewById(R.id.red);
		// Find the root view
		View root = someView.getRootView();
		// Set the color
		root.setBackgroundColor(this.colors[i]);
		// this.theView.setBackgroundColor(this.colors[i]);
		// this.setBackgroundColor(this.colors[i]);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	/*
	 * public void DoTheButton(View v) { EditText myInput
	 * =(EditText)findViewById(R.id.editText1); TextView myOutput
	 * =(TextView)findViewById(R.id.textView2);
	 * myOutput.setText(myInput.getText()); }
	 */
}
