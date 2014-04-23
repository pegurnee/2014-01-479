package com.example.todolist;

import android.app.Activity;
import android.app.AlertDialog;
import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class MainActivity extends Activity {

	private ListView lst_sensorListView;
	private final int[] COLORS = { R.color.myBlack, R.color.myDarkBlue,
			R.color.myDarkGreen, R.color.myDarkTeal, R.color.myDarkRed,
			R.color.myDarkMagenta, R.color.myDarkYellow, R.color.myLightGray,
			R.color.myDarkGray, R.color.myBlue, R.color.myGreen,
			R.color.myCyan, R.color.myRed, R.color.myMagenta, R.color.myYellow,
			R.color.myWhite };
	private final int[] COLOR_NAMES = { R.string.myBlack, R.string.myDarkBlue,
			R.string.myDarkGreen, R.string.myDarkTeal, R.string.myDarkRed,
			R.string.myDarkMagenta, R.string.myDarkYellow,
			R.string.myLightGray, R.string.myDarkGray, R.string.myBlue,
			R.string.myGreen, R.string.myCyan, R.string.myRed,
			R.string.myMagenta, R.string.myYellow, R.string.myWhite };
	private AlertDialog.Builder builder;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		this.builder = new AlertDialog.Builder(this);
		mSetupToDoList();
	}

	private void mSetupToDoList() {
		MyListViewCell list_data[] = new MyListViewCell[16];
		for (int i = 0; i < list_data.length; i++) {
			list_data[i] = new MyListViewCell(Color.parseColor(this
					.getResources().getString(this.COLOR_NAMES[i])), this
					.getResources().getString(this.COLOR_NAMES[i]));
		}

		ToDoListAdapter adapter = new ToDoListAdapter(this, R.layout.list_row,
				list_data);

		this.lst_sensorListView = (ListView) findViewById(R.id.myList);
		this.lst_sensorListView.setAdapter(adapter);

		// Handle list item click -- return the NXT 12-digit address
		this.lst_sensorListView
				.setOnItemClickListener(new OnItemClickListener() {
					public void onItemClick(AdapterView<?> av, View v,
							int arg2, long arg3) {
						builder.setMessage(
								"You select "
										+ getResources().getString(
												COLOR_NAMES[arg2]))
								.setPositiveButton("Ok",
										new DialogClickListener())
								.setTitle("Color").show();
					}
				});

	}

	private class DialogClickListener implements
			DialogInterface.OnClickListener {

		@Override
		public void onClick(DialogInterface dialog, int which) {
			switch (which) {
			case DialogInterface.BUTTON_POSITIVE:
				// lol but no idea
				break;
			case DialogInterface.BUTTON_NEGATIVE:
				// connectButton.setEnabled(false);
				break;
			}
		}

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	// adapter fill data as array
	private class ToDoListAdapter extends ArrayAdapter<MyListViewCell> {
		Context context;
		int layoutResourceId;
		MyListViewCell data[] = null;

		public ToDoListAdapter(Context context, int layoutResourceId,
				MyListViewCell[] data) {
			super(context, layoutResourceId, data);
			this.layoutResourceId = layoutResourceId;
			this.context = context;
			this.data = data;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			View row = convertView;
			MyListViewCellHolder holder = null;

			if (row == null) {
				LayoutInflater inflater = ((Activity) context)
						.getLayoutInflater();
				row = inflater.inflate(layoutResourceId, parent, false);

				holder = new MyListViewCellHolder();
				holder.imgIcon = (ImageView) row
						.findViewById(R.id.list_row_image);
				holder.txtTitle = (TextView) row
						.findViewById(R.id.list_row_text);

				row.setTag(holder);
			} else {
				holder = (MyListViewCellHolder) row.getTag();
			}

			MyListViewCell sensor = data[position];
			holder.txtTitle.setText(sensor.getTitle());
			holder.imgIcon.setBackgroundColor(sensor.getColor());

			return row;
		}

		private class MyListViewCellHolder {
			ImageView imgIcon;
			TextView txtTitle;
		}
	}

	// use a class as wrapper to hold data, so can be passed as array
	private class MyListViewCell {
		private int color;
		private String title;

		public MyListViewCell(int icon, String title) {
			super();
			this.color = icon;
			this.title = title;
		}

		public int getColor() {
			return color;
		}

		public String getTitle() {
			return title;
		}
	}
}
