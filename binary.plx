#!/usr/bin/perl
use warnings;
use strict;
use Tkx;
#binary.plx

#Declare variables
my $bin;
my $id;
my $color;
my $lastx;
my $lasty;
my $canvasScreen;

#Create Font
Tkx::font_create("TitleFont", -family => "Arial", -size => 16, -weight => "bold");
Tkx::font_create("HeaderFont", -family => "Arial", -size => 14);

#Create widget
my $wid = Tkx::widget->new(".");
$wid->g_wm_title("Counting Binary");
$wid->g_wm_geometry("+20+0");
$wid->g_grid_columnconfigure(0, -weight => 1);
$wid->g_grid_rowconfigure(0, -weight => 1);
my $top = $wid->new_ttk__label(-text=> "Learning the Basics of Binary", -font => "TitleFont", -justify => "center");
$top->g_grid(-column=>0, -row=> 0, -pady => 5, -padx => 30, -pady => 10, -sticky => 'w');
my $canvasButton = $wid->new_ttk__button(-text=> "Sketch Pad", -width => 10, -command => sub {openCanvas()});
$canvasButton->g_grid(-column=> 0, -row => 0, -sticky => 'e', -padx => 50);
my $sketch = $wid->new_ttk__label(-text => "Click the Sketch Pad button to assist you in solving the exercises.")->g_grid(-column => 0, -row => 1, -padx => 20, -pady=> 10, -sticky => 'w');

#Create Notebook and Tabs
my $note = $wid->new_ttk__notebook;
my $page1 = $note->new_ttk__frame();
my $page2 = $note->new_ttk__frame();
my $page3 = $note->new_ttk__frame();
my $page4 = $note->new_ttk__frame();
my $page5 = $note->new_ttk__frame();
my $page6 = $note->new_ttk__frame();
my $page7 = $note->new_ttk__frame();
my $page8 = $note->new_ttk__frame();
my $page9 = $note->new_ttk__frame();
my $page10 = $note->new_ttk__frame();
my $page11 = $note->new_ttk__frame();
my $page12 = $note->new_ttk__frame();

$note->add($page1, -text => "Basic\n");
$note->add($page2, -text=> "Basic\nExercise");
$note->add($page3, -text => "Adding\n");
$note->add($page4, -text => "Adding\nExercise");
$note->add($page5, -text => "Subtracting\n");
$note->add($page6, -text => "Subtracting\nExercise");
$note->add($page7, -text => "Multiplying\n");
$note->add($page8, -text => "Multiplying\nExercise");
$note->add($page9, -text => "Dividing\n");
$note->add($page10, -text => "Dividing\nExercise");
$note->add($page11, -text => "Big\nNumbers");
$note->add($page12, -text => "Final\nExam");
$note->g_grid(-column => 0, -row => 2, -sticky => "nwes", -padx => 10, -pady => 10);

#Create Images
Tkx::image_create_photo("zero1img", -file => "zero1.gif");
Tkx::image_create_photo("one1img", -file => "one1.gif");
Tkx::image_create_photo("zero2img", -file => "zero2.gif");
Tkx::image_create_photo("one2img", -file => "one2.gif");
Tkx::image_create_photo("zero3img", -file => "zero3.gif");
Tkx::image_create_photo("one3img", -file => "one3.gif");
Tkx::image_create_photo("tenimg", -file => "ten.gif");
Tkx::image_create_photo("zero4img", -file => "zero4.gif");
Tkx::image_create_photo("one4img", -file => "one4.gif");
Tkx::image_create_photo("zero4bimg", -file => "zero4b.gif");
Tkx::image_create_photo("one4bimg", -file => "one4b.gif");
Tkx::image_create_photo("zero5img", -file => "zero5.gif");
Tkx::image_create_photo("one5img", -file => "one5.gif");
Tkx::image_create_photo("zerooneimg", -file => "zeroone.gif");
Tkx::image_create_photo("zero6img", -file => "zero6.gif");
Tkx::image_create_photo("one6img", -file => "one6.gif");
Tkx::image_create_photo("zero6bimg", -file => "zero6b.gif");
Tkx::image_create_photo("one6bimg", -file => "one6b.gif");
Tkx::image_create_photo("zero10img", -file => "zero10.gif");
Tkx::image_create_photo("ten2img", -file => "ten2.gif");
Tkx::image_create_photo("eleven1img", -file => "eleven1.gif");
Tkx::image_create_photo("zeroone2img", -file => "zeroone2.gif");

#####Tab1 Basic#####
#Title
my $titleBasic = $page1->new_ttk__label( -text => "Basic Binary Values", -font => "TitleFont")->g_grid(-column => 1, -row => 0, -columnspan => 4, -pady => 20);

#Buttons
my $b0 = $page1->new_ttk__button(-width => 5, -text => 0, -command => sub {b0()});
$b0->g_grid(-column => 1, -row => 2);
my $b1 = $page1->new_ttk__button(-width => 5, -text => 1, -command => sub {b1()});
$b1->g_grid(-column => 2, -row => 2);
my $b2 = $page1->new_ttk__button(-width => 5, -text => 2, -command => sub {b2()});
$b2->g_grid(-column => 3, -row => 2);
my $b3 = $page1->new_ttk__button(-width => 5, -text => 3, -command => sub {b3()});
$b3->g_grid(-column => 4, -row => 2);
my $b4 = $page1->new_ttk__button(-width => 5, -text => 4, -command => sub {b4()});
$b4->g_grid(-column => 1, -row => 3);
my $b5 = $page1->new_ttk__button(-width => 5, -text => 5, -command => sub {b5()});
$b5->g_grid(-column => 2, -row => 3);
my $b6 = $page1->new_ttk__button(-width => 5, -text => 6, -command => sub {b6()});
$b6->g_grid(-column => 3, -row => 3);
my $b7 = $page1->new_ttk__button(-width => 5, -text => 7, -command => sub {b7()});
$b7->g_grid(-column => 4, -row => 3);
my $b8 = $page1->new_ttk__button(-width => 5, -text => 8, -command => sub {b8()});
$b8->g_grid(-column => 1, -row => 4);
my $b9 = $page1->new_ttk__button(-width => 5, -text => 9, -command => sub {b9()});
$b9->g_grid(-column => 2, -row => 4);
my $b10 = $page1->new_ttk__button(-width => 5, -text => 10, -command => sub {b10()});
$b10->g_grid(-column => 3, -row => 4);
my $b11 = $page1->new_ttk__button(-width => 5, -text => 11, -command => sub {b11()});
$b11->g_grid(-column => 4, -row => 4);
my $b12 = $page1->new_ttk__button(-width => 5, -text => 12, -command => sub {b12()});
$b12->g_grid(-column => 1, -row => 5);
my $b13 = $page1->new_ttk__button(-width => 5, -text => 13, -command => sub {b13()});
$b13->g_grid(-column => 2, -row => 5);
my $b14 = $page1->new_ttk__button(-width => 5, -text => 14, -command => sub {b14()});
$b14->g_grid(-column => 3, -row => 5);
my $b15 = $page1->new_ttk__button(-width => 5, -text => 15, -command => sub {b15()});
$b15->g_grid(-column => 4, -row => 5);

#Image
my $zero1 = $page1->new_ttk__label(-image=> "zero1img")->g_grid(-column => 0, -row => 3, -rowspan => 3);
my $one1 = $page1->new_ttk__label(-image => "one1img")->g_grid(-column => 5, -row => 3, -rowspan => 3);

#Text
my $text1a = $page1->new_ttk__label(-text =>"Hello! I'm Zero.");
$text1a->g_grid(-column => 0, -row=>2, -padx => 50);
my $text1b = $page1->new_ttk__label(-text =>"Hello! I'm One.");
$text1b->g_grid(-column => 5, -row=>1, -padx => 50);
my $text1c = $page1->new_ttk__label(-text =>"And we're the two members of the group Binary Digits. Today we're going to teach you the basics of binary.\n
Click on the buttons to see their binary values!", -justify => "center");
$text1c->g_grid(-column => 0, -row=>8, -padx => 50, -columnspan=> 6, -sticky=> "we");

#Entry
my $binval = $page1->new_ttk__entry(-width => 20,  -justify => "center", -font => "TitleFont", -textvariable => \$bin);
$binval->g_grid(-column => 1, -row=> 6, -columnspan => 4, -rowspan => 2, -pady=> 20);

#Return values
sub b0 {$bin = 0;}
sub b1 {$bin = 1;}
sub b2 {$bin = 10;}
sub b3 {$bin = 11;}
sub b4 {$bin = 100;}
sub b5 {$bin = 101;}
sub b6 {$bin = 110;}
sub b7 {$bin = 111;}
sub b8 {$bin = 1000;}
sub b9 {$bin = 1001;}
sub b10 {$bin = 1010;}
sub b11 {$bin = 1011;}
sub b12 {$bin = 1100;}
sub b13 {$bin = 1101;}
sub b14 {$bin = 1110;}
sub b15 {$bin = 1111;}

#####Tab2 Basic Ex#####
#Title
my $titleBasicEx = $page2->new_ttk__label(-text => "Example", -font=> "TitleFont")->g_grid(-column=>0, -row=>0, -columnspan => 2, -pady => 10);
my $questionBasic = $page2->new_ttk__label(-text => "Based on what you previously learned, what does 18 equal in binary?")->g_grid(-column => 0, -row => 1, -columnspan => 2, -sticky => "w", -padx => 25);
my $answerBasic;
my $choice1A = $page2->new_ttk__radiobutton(-text=>"10010", -variable => "\$answerBasic", -value => "10010");
$choice1A->g_grid(-column=> 0, -row=> 2, -sticky => "w", -padx => 20, -pady => 5);
my $choice1B = $page2->new_ttk__radiobutton(-text=>"10101", -variable => "\$answerBasic", -value => "10101");
$choice1B->g_grid(-column=> 0, -row=> 3, -sticky => "w", -padx => 20, -pady => 5);
my $choice1C = $page2->new_ttk__radiobutton(-text=>"11001", -variable => "\$answerBasic", -value => "11001");
$choice1C->g_grid(-column=> 0, -row=> 4, -sticky => "w", -padx => 20, -pady => 5);
my $choice1D = $page2->new_ttk__radiobutton(-text=>"18", -variable => "\$answerBasic", -value => "18");
$choice1D->g_grid(-column=> 0, -row=> 5, -sticky => "w", -padx => 20, -pady => 5);
my $clickButton = $page2->new_ttk__button(-width => 10, -text => "Click me!", -command => sub {basicanswer()});
$clickButton->g_grid(-column => 1, -row => 6, -sticky => "w", -padx => 20, -pady => 5);
my $seeAnswer = $page2->new_ttk__entry(-textvariable=> \$answerBasic, -width=> 30);
$seeAnswer->g_grid(-column => 0, -row => 6, -padx => 20);

sub basicanswer {
     if ($choice1A->state) {
          $answerBasic = "Correct!!!";
          my $zero2a = $page2->new_ttk__label(-image=> "zero1img")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one2a = $page2->new_ttk__label(-image=> "one1img")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     } else {
          $answerBasic = "Incorrect, please try again...";  
          my $zero2b = $page2->new_ttk__label(-image=> "zero2img")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one2b = $page2->new_ttk__label(-image=> "one2img")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     }
}

#####Tab3 Addition#####
#Title
my $titleAdd = $page3->new_ttk__label( -text => "How to Add in Binary", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 2, -pady => 10);
my $zero3 = $page3->new_ttk__label(-image => "zero3img")->g_grid(-column => 0, -row => 3, -sticky => "n");
my $one3 = $page3->new_ttk__label(-image => "one3img")->g_grid(-column => 1, -row => 2, -sticky => "n");
my $ten3 = $page3->new_ttk__label(-image => "tenimg")->g_grid(-column => 1, -row => 4, -sticky => "ne");

#Text
my $text3aEOF = <<EOF;
Let's start with me. When adding two of me, I know
I need to grow, but I'm afraid to do so.  So I will
remain Zero.  Now One will tell his story.
EOF
my $text3a = $page3->new_ttk__label(-text=> $text3aEOF);
$text3a->g_grid( -column => 0, -row => 2, -padx => 20, -pady => 20, -sticky => "n");

my $text3bEOF = <<EOF;
Now it's my turn.  When adding two of me, I know I need
to grow, but I'm the biggest digit around, so I have to
get creative.  I can't stay a One, so I become Zero.  But
the other One gets carried over next to Zero and we become
best friends.  Therefore, One plus One in binary equals 10,
which for you decimal folks, is equal to 2. Now lets talk
about adding One and Zero together.
EOF
my $text3b = $page3->new_ttk__label(-text => $text3bEOF);
$text3b->g_grid( -column=> 1, -row => 3, -padx => 20, -pady=> 20, -sticky => "n");

my $text3cEOF = <<EOF;
So, when adding One and Zero, Zero refuses to change and One
is waiting to grow, so therefore, we'll remain as One.  Adding our
paired friends Ten to One, we see that One is more willing to be
with the other One than its original friend Zero, therefore, Ten plus
One in binary equals 11, which for you decimal folks, is equal to 3.
EOF
my $text3c = $page3->new_ttk__label(-text => $text3cEOF);
$text3c->g_grid( -column=> 0, -row => 4, -padx => 20, -pady=> 20, -columnspan => 2, -sticky => "nw");

#####Tab4 Addition Ex#####
#Title
my $tryAdd = $page4->new_ttk__label( -text => "Try it yourself", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 3, -pady => 10);

#Example
my $example4 = $page4->new_ttk__label( -text => "Question: 1010 + 1111 = ", -font => "HeaderFont")->g_grid(-column => 0, -row => 1, -columnspan => 2, -sticky => "w", -padx => 25);

#RadioButtons
my $answerAdd;
my $choice2A = $page4->new_ttk__radiobutton(-text=>"10010", -variable => "\$answerAdd", -value => "10010");
$choice2A->g_grid(-column=> 0, -row=> 2, -sticky => "w", -padx => 20, -pady => 5);
my $choice2B = $page4->new_ttk__radiobutton(-text=>"11111", -variable => "\$answerAdd", -value => "11111");
$choice2B->g_grid(-column=> 0, -row=> 3, -sticky => "w", -padx => 20, -pady => 5);
my $choice2C = $page4->new_ttk__radiobutton(-text=>"11010", -variable => "\$answerAdd", -value => "11010");
$choice2C->g_grid(-column=> 0, -row=> 4, -sticky => "w", -padx => 20, -pady => 5);
my $choice2D = $page4->new_ttk__radiobutton(-text=>"100100", -variable => "\$answerAdd", -value => "100100");
$choice2D->g_grid(-column=> 0, -row=> 5, -sticky => "w", -padx => 20, -pady => 5);

#Button
my $clickButton2 = $page4->new_ttk__button(-width => 10, -text => "Click me!", -command => sub {basicanswer2()});
$clickButton2->g_grid(-column => 1, -row => 6, -sticky => "w", -pady => 5, -padx => 10);

#Entry
my $seeAnswer2 = $page4->new_ttk__entry(-textvariable=> \$answerAdd, -width=> 30);
$seeAnswer2->g_grid(-column => 0, -row => 6, -padx => 20);

sub basicanswer2 {
     if ($choice2C->state) {
          $answerAdd = "Correct!!!";
          my $zero4a = $page4->new_ttk__label(-image=> "zero4img")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one4a = $page4->new_ttk__label(-image=> "one4img")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     } else {
          $answerAdd = "Incorrect, please try again...";  
          my $zero4b = $page4->new_ttk__label(-image=> "zero4bimg")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one4b = $page4->new_ttk__label(-image=> "one4bimg")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     }
}


#####Tab5 Subtraction####
#Title
my $titleSubtract = $page5->new_ttk__label( -text => "How to subtract in Binary", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 2, -pady => 10);

#Image
my $zero5 = $page5->new_ttk__label(-image => "zero5img")->g_grid(-column => 0, -row => 3, -sticky => "nw");
my $one5 = $page5->new_ttk__label(-image => "one5img")->g_grid(-column => 1, -row => 2, -sticky => "nw");
my $zeroone = $page5->new_ttk__label(-image => "zerooneimg")->g_grid(-column => 0, -row => 4, -sticky => "n");

#Text
my $text5aEOF = <<EOF;
Now it's time to learn subtraction. It's similar to
addition instead of growing, we want to shrink.
Let's start with me, Zero!  I can't shrink to a larger
number, so I will remain zero.  Now it's One's turn.
EOF
my $text5a = $page5->new_ttk__label(-text=> $text5aEOF);
$text5a->g_grid( -column => 0, -row => 2, -padx => 20, -pady => 20, -sticky => "nw");

my $text5bEOF = <<EOF;
I too need to shrink, but I can't stay one, so I
must also go to zero. Now we'll explain what
happens you involve one and zero, where things
get interesting!
EOF
my $text5b = $page5->new_ttk__label(-text => $text5bEOF);
$text5b->g_grid( -column=> 1, -row => 3, -padx => 20, -pady=> 20, -sticky => "nwes");

my $text5cEOF = <<EOF;
It's easier to subtract Zero from One than One
from Zero.  Why? Because One is bigger than zero.
When subtracting zero from one, nothing changes
and the value remains.  BUT, when you subtract one
from zero, you need help because one is larger than
zero. The value equals one, but you must borrow from
the next digit over to make it work.
EOF
my $text5c = $page5->new_ttk__label(-text => $text5cEOF);
$text5c->g_grid( -column=> 1, -row => 4, -padx => 20, -pady=> 20, -sticky => "nwes");

#####Tab6 Subtraction Ex#####

#Title
my $trySubtract = $page6->new_ttk__label( -text => "Try it yourself", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 3, -pady => 10);

#Example
my $example6 = $page6->new_ttk__label( -text => "Question: 11001 - 00111 = ", -font => "HeaderFont")->g_grid(-column => 0, -row => 1, -columnspan => 2, -sticky => "w", -padx => 25);


#Radio Buttons
my $answerSubtract;
my $choice3A = $page6->new_ttk__radiobutton(-text=>"10010", -variable => "\$answerSubtract", -value => "10010");
$choice3A->g_grid(-column=> 0, -row=> 2, -sticky => "w", -padx => 20, -pady => 5);
my $choice3B = $page6->new_ttk__radiobutton(-text=>"11111", -variable => "\$answerSubtract", -value => "11111");
$choice3B->g_grid(-column=> 0, -row=> 3, -sticky => "w", -padx => 20, -pady => 5);
my $choice3C = $page6->new_ttk__radiobutton(-text=>"11010", -variable => "\$answerSubtract", -value => "11010");
$choice3C->g_grid(-column=> 0, -row=> 4, -sticky => "w", -padx => 20, -pady => 5);
my $choice3D = $page6->new_ttk__radiobutton(-text=>"100100", -variable => "\$answerSubtract", -value => "100100");
$choice3D->g_grid(-column=> 0, -row=> 5, -sticky => "w", -padx => 20, -pady => 5);

#Button
my $clickButton3 = $page6->new_ttk__button(-width => 10, -text => "Click me!", -command => sub {basicanswer3()});
$clickButton3->g_grid(-column => 1, -row => 6, -sticky => "w", -pady => 5, -padx => 10);

#Entry
my $seeAnswer3 = $page6->new_ttk__entry(-textvariable=> \$answerSubtract, -width=> 30);
$seeAnswer3->g_grid(-column => 0, -row => 6, -padx => 20);

sub basicanswer3 {
     if ($choice3C->state) {
          $answerSubtract = "Correct!!!";
          my $zero6a = $page6->new_ttk__label(-image=> "zero6img")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one6a = $page6->new_ttk__label(-image=> "one6img")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     } else {
          $answerSubtract = "Incorrect, please try again...";  
          my $zero6b = $page6->new_ttk__label(-image=> "zero6bimg")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one6b = $page6->new_ttk__label(-image=> "one6bimg")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     }
}


#####Tab7 Multiplication#####
#Title
my $titleMultiply = $page7->new_ttk__label( -text => "How to Multiply in Binary", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 2, -pady => 10);

#Image
my $eleven = $page7->new_ttk__label(-image => "eleven1img")->g_grid(-column => 0, -row => 3, -sticky => "n");
my $ten2 = $page7->new_ttk__label(-image => "ten2img")->g_grid(-column => 1, -row => 2, -sticky => "n");
#Text
my $text7aEOF = <<EOF;
Now it's time to discuss multiplication. We'll
need some help from our good friends, Ten and
Eleven to explain. Multiplying takes more effort
than adding and subtracting because we need to
grow even faster than adding.
EOF
my $text7a = $page7->new_ttk__label(-text=> $text7aEOF);
$text7a->g_grid( -column => 0, -row => 2, -padx => 20, -pady => 20, -sticky => "n");

my $text7bEOF = <<EOF;
To start, you need to multiply each digit
individually. When multiplying, zero trumps one,
so anything multiplied by zero will always be
zero. Only when you multiply 1 by 1 will it equal 1.
Multiply 10 by 11, you first multiply zero by each
digit in 11. This equals 00. But you can't forget
about zero's pal 1. Now you get to multiply him
by each digit in 11. But this digit starts underneath,
never to the right, it needs a zero cushion.
That leaves us with 110.
EOF
my $text7b = $page7->new_ttk__label(-text => $text7bEOF);
$text7b->g_grid( -column=> 1, -row => 3, -padx => 20, -pady=> 20, -sticky => "nwes");

my $text7cEOF = <<EOF;
Now we have to add the two results to get our answer. Of course,
adding zero to anything won't change our answer, so we get 110.
EOF
my $text7c = $page7->new_ttk__label(-text => $text7cEOF);
$text7c->g_grid( -column=> 0, -row => 4, -padx => 20, -pady=> 20, -columnspan => 2, -sticky => "nw");

#####Tab8 Multiplication Ex#####
#Title
my $tryMultiply = $page8->new_ttk__label( -text => "Try it yourself", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 3, -pady => 10);

#Example
my $example8 = $page8->new_ttk__label( -text => "Question: 1001 x 0111 =", -font => "HeaderFont"
)->g_grid(-column => 0, -row => 1, -columnspan => 2, -sticky => "w", -padx => 25);

#Radio Buttons
my $answerMultiply;
my $choice4A = $page8->new_ttk__radiobutton(-text=>"101101", -variable => "\$answerMultiply", -value => "10010");
$choice4A->g_grid(-column=> 0, -row=> 2, -sticky => "w", -padx => 20, -pady => 5);
my $choice4B = $page8->new_ttk__radiobutton(-text=>"111111", -variable => "\$answerMultiply", -value => "11111");
$choice4B->g_grid(-column=> 0, -row=> 3, -sticky => "w", -padx => 20, -pady => 5);
my $choice4C = $page8->new_ttk__radiobutton(-text=>"110100", -variable => "\$answerMultiply", -value => "11010");
$choice4C->g_grid(-column=> 0, -row=> 4, -sticky => "w", -padx => 20, -pady => 5);
my $choice4D = $page8->new_ttk__radiobutton(-text=>"100000", -variable => "\$answerMultiply", -value => "100100");
$choice4D->g_grid(-column=> 0, -row=> 5, -sticky => "w", -padx => 20, -pady => 5);

#Button
my $clickButton4 = $page8->new_ttk__button(-width => 10, -text => "Click me!", -command => sub {basicanswer4()});
$clickButton4->g_grid(-column => 1, -row => 6, -sticky => "w", -padx => 20, -pady => 5);

#Entry
my $seeAnswer4 = $page8->new_ttk__entry(-textvariable=> \$answerMultiply, -width=> 30);
$seeAnswer4->g_grid(-column => 0, -row => 6, -padx => 20);

sub basicanswer4 {
     if ($choice4B->state) {
          $answerMultiply = "Correct!!!";
          my $zero8a = $page8->new_ttk__label(-image=> "zero4img")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one8a = $page8->new_ttk__label(-image=> "one4img")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     } else {
          $answerMultiply = "Incorrect, please try again...";  
          my $zero8b = $page8->new_ttk__label(-image=> "zero4bimg")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one8b = $page8->new_ttk__label(-image=> "one4bimg")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     }
}

#####Tab9 Division#####
#Title
my $titleDivide = $page9->new_ttk__label( -text => "How to Divide in Binary", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 2, -pady => 10);

#Image
my $zeroone2 = $page9->new_ttk__label(-image => "zeroone2img")->g_grid(-column => 0, -row => 3, -sticky => "n");

#Text
my $text9aEOF = <<EOF;
Now it's time to teach you about division. Dividing in binary is like you would do in decimal.
To show you how, let's start by dividing 110 by 11010. In order to get the answer, check to see if 110 divides
equally into the first digit.  If it does, write 1 above the digit. If not, write 0 above it and add the next digit to it and compare.
EOF
my $text9a = $page9->new_ttk__label(-text=> $text9aEOF);
$text9a->g_grid( -column => 0, -row => 2, -padx => 20, -pady => 20, -sticky => "n");

my $text9bEOF = <<EOF;
When you find a number that is equal or greater than the dividing number, write 1 above the digit and then subtract
the divisible number from the base number. In our example 110 - 110 equals 0.  But don't forget the other digits from the
original number. Add them to your new number, which for us, equals 10.  Repeat the process until you have a number that
can't be divided by the divisible number. For us, 10 is less than 110 so it can't be used.  But what do we do with this leftover?
It becomes a remainder. It's part of the number but not a whole part. Thus, our answer to  110 / 11010 is 100 with a remainder of 10.
EOF

my $text9b = $page9->new_ttk__label(-text => $text9bEOF);
$text9b->g_grid( -column=> 0, -row => 4, -padx => 20, -pady=> 20, -columnspan => 2, -sticky => "nw");

#####Tab10 Division Ex#####
#Title
my $try10 = $page10->new_ttk__label( -text => "Try it yourself", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 3, -pady => 10);

#Example
my $example10 = $page10->new_ttk__label( -text => "Question: 110 / 111010 = ", -font => "HeaderFont")->g_grid(-column => 0, -row => 1, -columnspan => 2, -sticky => "w", -padx => 25);

#Radio Button
my $answerDivide;
my $choice5A = $page10->new_ttk__radiobutton(-text=>"10010 with a remainder of 11", -variable => "\$answerDivide", -value => "10010");
$choice5A->g_grid(-column=> 0, -row=> 2, -sticky => "w", -padx => 20, -pady => 5);
my $choice5B = $page10->new_ttk__radiobutton(-text=>"10001 with a remainder of 10", -variable => "\$answerDivide", -value => "11111");
$choice5B->g_grid(-column=> 0, -row=> 3, -sticky => "w", -padx => 20, -pady => 5);
my $choice5C = $page10->new_ttk__radiobutton(-text=>"10000 with a remainder of 100", -variable => "\$answerDivide", -value => "11010");
$choice5C->g_grid(-column=> 0, -row=> 4, -sticky => "w", -padx => 20, -pady => 5);
my $choice5D = $page10->new_ttk__radiobutton(-text=>"10111 with a remainder of 1", -variable => "\$answerDivide", -value => "100100");
$choice5D->g_grid(-column=> 0, -row=> 5, -sticky => "w", -padx => 20, -pady => 5);

#Button
my $clickButton5 = $page10->new_ttk__button(-width => 10, -text => "Click me!", -command => sub {basicanswer5()});
$clickButton5->g_grid(-column => 1, -row => 6, -sticky => "w", -padx => 20, -pady => 5);

#Entry
my $seeAnswer5 = $page10->new_ttk__entry(-textvariable=> \$answerDivide, -width=> 30);
$seeAnswer5->g_grid(-column => 0, -row => 6, -padx => 20);

sub basicanswer5 {
     if ($choice5B->state) {
          $answerDivide = "Correct!!!";
          my $zero10a = $page10->new_ttk__label(-image=> "zero6img")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one10a = $page10->new_ttk__label(-image=> "one6img")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     } else {
          $answerDivide = "Incorrect, please try again...";  
          my $zero10b = $page10->new_ttk__label(-image=> "zero6bimg")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one10b = $page10->new_ttk__label(-image=> "one6bimg")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     }
}

#####Tab11 Big Numbers#####

#Title
my $titleBigNumber = $page11->new_ttk__label( -text => "Big Numbers", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 2, -pady => 10);

#Image
my $zero11 = $page11->new_ttk__label(-image => "zero10img")->g_grid(-column => 0, -row => 3, -sticky => "ne");

#Text
my $text11aEOF = <<EOF;
We've taught you how to do basic arithmetic with binary numbers, addition, subtraction, multiplication
and division.  But what happens if you need a really large binary numbers, like binary number 10000000?
The trick is to start with the decimal number and convert to binary.  If you remember this trick, it
will help you significantly.  When a binary number starts with 1 and only has 0's after it, the decimal
equivalent is 2 * the number of 0's following it. 2 is equal to 2 * 1.  The binary equivalent is 10,
which contains one 0.  Therefore 2^x will always be in binary 1 followed by x amount of zeros.  2^8
in binary equals 100000000, or 256 in decimal
EOF
my $text11a = $page11->new_ttk__label(-text=> $text11aEOF);
$text11a->g_grid( -column => 0, -row => 2, -padx => 20, -pady => 20, -sticky => "n");

my $text11bEOF = <<EOF;
Once you figure this out, you can add or subtract
from this number to determine other numbers.
For example, to determine what 260 is in binary,
you determine that it is great than 256 but less than
512 (256 X 2), so the binary base with by 100000000,
which is 256 in decimal.  Subtract 260 from 256 to get
4 in decimal.  Now you have a smaller binary number
to add to 100000000, which is 100.  So you can easily
figure out that 260 in binary is 100000100. This also
works for subtraction, multiplication and division.
EOF

my $text11b = $page11->new_ttk__label(-text => $text11bEOF);
$text11b->g_grid( -column=> 0, -row => 3, -padx => 20, -pady=> 20, -columnspan => 2, -sticky => "nw");

#####Tab12 Big Number Ex#####

#Title
my $try12 = $page12->new_ttk__label( -text => "Try it yourself", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 3, -pady => 10);

#Example
my $example12 = $page12->new_ttk__label( -text => "Question: What is 1025 in binary", -font => "HeaderFont")->g_grid(-column => 0, -row => 1, -columnspan => 2, -sticky => "w", -padx => 25);

#Radio Button
my $answerBig;
my $choice6A = $page12->new_ttk__radiobutton(-text=>"100000001", -variable => "\$answerBig", -value => "10010");
$choice6A->g_grid(-column=> 0, -row=> 2, -sticky => "w", -padx => 20, -pady => 5);
my $choice6B = $page12->new_ttk__radiobutton(-text=>"100000100", -variable => "\$answerBig", -value => "11111");
$choice6B->g_grid(-column=> 0, -row=> 3, -sticky => "w", -padx => 20, -pady => 5);
my $choice6C = $page12->new_ttk__radiobutton(-text=>"110000001", -variable => "\$answerBig", -value => "11010");
$choice6C->g_grid(-column=> 0, -row=> 4, -sticky => "w", -padx => 20, -pady => 5);
my $choice6D = $page12->new_ttk__radiobutton(-text=>"100100000", -variable => "\$answerBig", -value => "100100");
$choice6D->g_grid(-column=> 0, -row=> 5, -sticky => "w", -padx => 20, -pady => 5);
#Button
my $clickButton6 = $page12->new_ttk__button(-width => 10, -text => "Click me!", -command => sub {basicanswer6()});
$clickButton6->g_grid(-column => 1, -row => 6, -sticky => "w", -padx => 20, -pady => 5);
#Entry
my $seeAnswer6 = $page12->new_ttk__entry(-textvariable=> \$answerBig, -width=> 30);
$seeAnswer6->g_grid(-column => 0, -row => 6, -padx => 20);

sub basicanswer6 {
     if ($choice6A->state) {
          $answerBig = "Correct!!!";
          my $zero12a = $page12->new_ttk__label(-image=> "zero1img")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one12a = $page12->new_ttk__label(-image=> "one1img")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     } else {
          $answerBig = "Incorrect, please try again...";  
          my $zero12b = $page12->new_ttk__label(-image=> "zero2img")->g_grid(-column => 2, -row => 2, -rowspan => 5, -sticky=> "w");
          my $one12b = $page12->new_ttk__label(-image=> "one2img")->g_grid(-column => 3, -row => 2, -rowspan => 5, -sticky => "e");
     }
}

#Canvas subroutines
sub openCanvas {
         my $canvasWindow = $wid->new_toplevel;
         $canvasWindow->g_wm_title("Sketch Pad");
         my $canvasFrame = $canvasWindow->new_ttk__frame( -padding => 5);
         $canvasFrame->g_grid(-column => 0, -row => 0, -sticky => 'nwes');
         $canvasScreen = $canvasFrame->new_tk__canvas(-width => 600, -height => 300, -bg => "white", -bd => 10, -relief => "groove");
         $canvasScreen->g_grid(-column=> 0, -row=> 0, -columnspan => 2, -padx=> 20);
         $canvasScreen->g_bind("<1>", [sub {my ($x,$y) = @_; $lastx=$canvasScreen->canvasx($x); $lasty=$canvasScreen->canvasy($y)}, Tkx::Ev("%x","%y")]);
         $canvasScreen->g_bind("<B1-Motion>", [sub {my ($x,$y) = @_; addLine($canvasScreen->canvasx($x),$canvasScreen->canvasy($y))}, Tkx::Ev("%x","%y")]);
         $canvasScreen->g_bind("<B1-ButtonRelease>", sub {doneStroke();});
         $id = $canvasScreen->create_rectangle(20, 35, 40, 55, -fill => "white", -tags => "palette palettewhite");
         $canvasScreen->bind($id, "<1>", sub {setColor("white")});
         $id = $canvasScreen->create_rectangle(20, 60, 40, 80, -fill => "black", -tags => "palette paletteblack paletteSelected");
         $canvasScreen->bind($id, "<1>", sub {setColor("black")});
}

sub setColor {
    my ($newcolor) = @_;
    $color = $newcolor;
    $canvasScreen->dtag_all("paletteSelected");
    $canvasScreen->itemconfigure("palette", -outline => "black");
    $canvasScreen->addtag("paletteSelected", withtag => "palette".$color);
    $canvasScreen->itemconfigure("paletteSelected", -outline => "#999999");
}

sub addLine {
    my ($x,$y) = @_;
    $canvasScreen->create_line($lastx,$lasty,$x,$y, -fill => $color, -width => 5, -tags => "currentline");
    $lastx = $x; $lasty = $y;
}

sub doneStroke {
    $canvasScreen->itemconfigure("currentline", -width =>5);
}

#Run program
Tkx::MainLoop();
