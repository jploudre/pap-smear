Papsmear Script
===============

To Use
------

* You should de-duplicate paps in the Excel spreadsheet first (use the most recent.)
* 'Save As' the spreadsheet to a CSV file named 'papsmear.csv'.
* Put that file into the same folder as the script.
* Open the Script (puts a small 'H' icon on your lower right screen tray).
* Press 'F12' to start looping through pap smears.

Process
-------

For each name, the script will open the chart. If there are duplicate names, the one with an account ZZ....... is the correct one.

The script will show you the date of the pap smear to find. A custom view of 'Labs' will make it quicker to find.

Once you've found and reviewed the pap, Hit 'F5' to resume the script. It will then open a preventive update.

In the preventive update, the date of the pap will be on the clipboard -- you can paste it into the date box with Ctrl-V.

When you hit 'F5' again, it will commit to the flowsheet, close and sign the update and open the next patient. If there is a 2014 Pap and it's already in the flowsheet, you can hit 'F5' without entering any data -- no harm done. 

Running into Trouble
--------------------

If you realize an issue, go to the 'H' icon on the tray and 'reload' it. You can then delete the lines from your papsmear.csv so you can restart where you left off. Might as well keep that file open in Notepad so you can restart quickly. 
