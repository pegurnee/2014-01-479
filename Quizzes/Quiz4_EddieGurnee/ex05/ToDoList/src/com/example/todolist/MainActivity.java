package com.example.todolist;

import java.util.ArrayList;
import java.util.Collections;

import android.app.ListActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends ListActivity {

	ArrayList<String> myListData = new ArrayList<String>();
	ArrayAdapter<String> myListDataAdapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// myListData.add("first"); myListData.add("second");
		// myListData.add("third");

		String[] items = { "first", "second", "third" };
		Collections.addAll(myListData, items);

		myListDataAdapter = new ArrayAdapter<String>(this,
				android.R.layout.simple_list_item_1, myListData);
		this.setListAdapter(myListDataAdapter);

		Button addButton = (Button) findViewById(R.id.myButton);
		addButton.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View view) {
				EditText myTextField = (EditText) findViewById(R.id.myTextField);
				if (myTextField.getText().toString().isEmpty()) {
					Toast.makeText(view.getContext(), "empty input",
							Toast.LENGTH_LONG).show();
				} else {
					myListData.add(myTextField.getText().toString());
					myListDataAdapter.notifyDataSetChanged();
				}
			}
		});

		Button delButton = (Button) this.findViewById(R.id.delButton);
		delButton.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View view) {
				if (myListData.size() == 0) {
					Toast.makeText(view.getContext(), "the list is empty",
							Toast.LENGTH_LONG).show();
				} else {
					myListData.remove(0);
					myListDataAdapter.notifyDataSetChanged();
				}
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
