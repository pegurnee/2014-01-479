package my.android;

//import android.app.Activity;
import android.os.Bundle;

import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.Collections;

import android.widget.ArrayAdapter;
import android.widget.EditText;
//import android.widget.ListView;
import android.app.ListActivity;
import android.view.View;

import java.io.File;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import android.content.res.AssetManager;


public class ToDoListFileActivity extends ListActivity {
  /** Called when the activity is first created. */

  ArrayList<String> myListData = new ArrayList<String>();
  ArrayAdapter<String> myListDataAdapter;
  private final static String MYFILENAME="myFile.txt";

  @Override
  public void onCreate(Bundle icicle) {

  	super.onCreate(icicle);
  	setContentView(R.layout.main);
  	
  	//myListData.add("first");
  	//myListData.add("second");
  	//myListData.add("third");
  	 
  	//String[] items = {"first", "second", "third"};
  	//Collections.addAll(myListData, items); 

  	myListData.add("File Content");
  	readFileFromInternalStorage(myListData);
  	
  	myListDataAdapter=new ArrayAdapter<String>(this,
  			android.R.layout.simple_list_item_1, myListData);
  	this.setListAdapter(myListDataAdapter);
  }

  public void myButtonOnClick(View v) {
  	EditText myTextField = (EditText) findViewById(R.id.myTextField);
  	myListData.add(myTextField.getText().toString());
  	writeFileToInternalStorage(myTextField.getText().toString());
  	myListDataAdapter.notifyDataSetChanged();
  }
  
  private void writeFileToInternalStorage(String str) {
		String eol = System.getProperty("line.separator");
		BufferedWriter writer = null;
		try {
		  writer = new BufferedWriter(new OutputStreamWriter(openFileOutput(
				  MYFILENAME, MODE_WORLD_WRITEABLE)));
		  //writer.write("This is a test1." + eol);
		  //writer.write("This is a test2." + eol);
		  writer.write(str + eol);		  
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
		  if (writer != null) {
			try {
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		  }
		}
	}
  
  private void readFileFromInternalStorage(ArrayList<String> myList) {
		//String eol = System.getProperty("line.separator");
		BufferedReader input = null;
		try {
			AssetManager mgr = getAssets();
			InputStream in = mgr.open(MYFILENAME);
			InputStreamReader isr = new InputStreamReader(in);
			
		  input = new BufferedReader(isr);
		  String line;
		  //StringBuffer buffer = new StringBuffer();
		  while ((line = input.readLine()) != null) {
			//buffer.append(line + eol);
			myList.add(line);
		  }
		} catch (Exception e) {
		 	e.printStackTrace();
		} finally {
		if (input != null) {
		  try {
			input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		  }
		}
	}
}