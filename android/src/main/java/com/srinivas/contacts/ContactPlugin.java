package com.srinivas.contacts;

import android.util.Log;

public class ContactPlugin {

    public String echo(String value) {
        Log.i("Echo", value);
        return value;
    }
}
