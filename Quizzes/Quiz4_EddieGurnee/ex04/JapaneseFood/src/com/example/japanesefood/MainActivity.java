package com.example.japanesefood;

import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.ActionBarActivity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class MainActivity extends ActionBarActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		if (savedInstanceState == null) {
			getSupportFragmentManager().beginTransaction()
					.add(R.id.container, new PlaceholderFragment()).commit();
		}
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {

		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}

	/**
	 * A placeholder fragment containing a simple view.
	 */
	public static class PlaceholderFragment extends Fragment {

		public PlaceholderFragment() {
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			View rootView = inflater.inflate(R.layout.fragment_main, container,
					false);

			TextView directions = (TextView) rootView
					.findViewById(R.id.actual_direction);
			directions.setText("Mix sesame oil, lemon juice, "
					+ "soy sauce, brown sugar, sesame seeds, "
					+ "ground mustard, ginger, and garlic powder "
					+ "in a small saucepan over low heat. Bring to a "
					+ "simmer, stirring until sugar has dissolved. "
					+ "Set aside 1/2 cup of marinade for basting. "
					+ "\nPour remaining marinade into a resealable "
					+ "plastic bag and place salmon into the marinade. "
					+ "Squeeze air out of the bag, seal, and marinate "
					+ "the salmon steaks for at least 1 hour (2 hours "
					+ "for better flavor). Drain and discard used marinade.");

			// directions.
			TextView japanese = (TextView) rootView.findViewById(R.id.japanese);
			japanese.setText("Japanese");
			japanese.setTextColor(Color.rgb(132, 5, 62));
			TextView direct_lbl = (TextView) rootView
					.findViewById(R.id.directions);
			direct_lbl.setText("Directions");
			return rootView;
		}
	}

}
