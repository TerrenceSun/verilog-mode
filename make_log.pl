#!/usr/local/bin/perl
unlink("verilog-mode.el.gz", "uu", "log");
system("gzip -c9 verilog-mode.el | uuencode verilog-mode.el.gz > uu");
system("cvs log verilog-mode.el > log");
open(LOG,"<log");
while(<LOG>) {
  if (/^head: ([\d\.]+)$/) {
    $rev = $1;
  }
  last if (/^description:$/);
}
open(O,">uuencoded_verilog-mode");
print O "-------------------------------------------------------------------\n";
print O "|         Here is version $rev of verilog-mode for emacs!         |\n";
print O <<"X";
-------------------------------------------------------------------

First, a  bit about SureFire Verification.   In addition to supporting
the verilog-mode,  SureFire Verification develops verification related
tools  for  Verilog users.  There  are currently   two tools: one that
measures code coverage of a  given test bench,  and another that helps
to automate the test bench creation process.   For more information on
these products, please  visit our web site, http://www.surefirev.com/,
or contact us directly at 408-374-4100 x203.

Now back to the verilog-mode:

The  major  new addition  to version 3   (hence  the new major release
number)  is  AUTO,  from  Wilson Snyder,   wsnyder\@wsnyder.org. AUTO
provides a rich set of capabilities for automatically generating input
declarations, or sensitivity lists.  To  learn more, install the file,
and pull down the Verilog Menu bar, and select Help

To install this file, go to

<http://www.surefirev.com/emacs_install.html>

and read the directions.

If you have  any problems with  the  file, feel  from to send  mail to
verilog-mode-bugs\@surefirev.com and your  mail will be entered in  our
bug tracking system.

Please keep an eye on our web page <http://www.surefirev.com> as
various new features are announced all the time, which may interest
you.
X

print O "Last few changes to the verilog-mode:\n";
while(<LOG>) {
  $log++ if (/^----------------------------$/);
  last if ($log > 10);
  print O $_;
}
close(O);
close(LOG);
unlink("verilog-mode.el.gz", "uu", "log");
