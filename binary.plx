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

#Create Font
Tkx::font_create("TitleFont", -family => "Arial", -size => 16, -weight => "bold");
Tkx::font_create("HeaderFont", -family => "Arial", -size => 14);

#Create widget
my $wid = Tkx::widget->new(".");
$wid->g_wm_title("Counting Binary");
$wid->g_grid_columnconfigure(0, -weight => 1);
$wid->g_grid_rowconfigure(0, -weight => 1);
my $top = $wid->new_ttk__label(-text=> "Learning the Basics of Binary", -font => "TitleFont");
$top->g_grid(-column=>0, -row=> 0, -pady => 20);

#Create Notebook and Tabs
my $note = $wid->new_ttk__notebook;
my $page1 = $note->new_ttk__frame();
my $page2 = $note->new_ttk__frame();
my $page3 = $note->new_ttk__frame();
my $page4 = $note->new_ttk__frame();

$note->add($page1, -text => "Basic");
$note->add($page2, -text=> "Basic Exercise");
$note->add($page3, -text => "Adding");
$note->add($page4, -text => "Adding exercise");
$note->g_grid(-column => 0, -row => 1, -sticky => "nwes");

#Tab1
#Title
my $title = $page1->new_ttk__label( -text => "Basic Binary Values", -font => "TitleFont")->g_grid(-column => 1, -row => 0, -columnspan => 4, -pady => 20);

#Zero and One
Tkx::image_create_photo("zeroimg", -file => "zero.gif");
my $zero = $page1->new_ttk__label(-image=> "zeroimg")->g_grid(-column => 0, -row => 3, -rowspan => 3);
Tkx::image_create_photo("oneimg", -file => "one.gif");
my $one = $page1->new_ttk__label(-image => "oneimg")->g_grid(-column => 5, -row => 3, -rowspan => 3);

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

my $zerotext1 = $page1->new_ttk__label(-text =>"Hello! I'm Zero.");
$zerotext1->g_grid(-column => 0, -row=>2, -padx => 50);
my $onetext1 = $page1->new_ttk__label(-text =>"Hello! I'm One.");
$onetext1->g_grid(-column => 5, -row=>1, -padx => 50);
my $binary1 = $page1->new_ttk__label(-text =>"And we're the two members of the group Binary Digits. Today we're going to teach you the basics of binary.\n
Click on the buttons to see their binary values!", -justify => "center");
$binary1->g_grid(-column => 0, -row=>8, -padx => 50, -columnspan=> 6, -sticky=> "we");

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

#Tab2
#Title
my $title2 = $page2->new_ttk__label(-text => "Example", -font=> "TitleFont")->g_grid(-column=>0, -row=>0, -columnspan => 2, -pady => 10);
my $question2 = $page2->new_ttk__label(-text => "Based on what you previously learned, what does 18 equal in binary?")->g_grid(-column=>0, -row => 1, -sticky => "w", -padx => 20);
my $eighteen;
my $choice1 = $page2->new_ttk__radiobutton(-text=>"10010", -variable => "\$eighteen", -value => "10010");
$choice1->g_grid(-column=> 0, -row=> 2, -sticky => "w", -padx => 20, -pady => 5);
my $choice2 = $page2->new_ttk__radiobutton(-text=>"10101", -variable => "\$eighteen", -value => "10101");
$choice2->g_grid(-column=> 0, -row=> 3, -sticky => "w", -padx => 20, -pady => 5);
my $choice3 = $page2->new_ttk__radiobutton(-text=>"11001", -variable => "\$eighteen", -value => "11001");
$choice3->g_grid(-column=> 0, -row=> 4, -sticky => "w", -padx => 20, -pady => 5);
my $choice4 = $page2->new_ttk__radiobutton(-text=>"18", -variable => "\$eighteen", -value => "18");
$choice4->g_grid(-column=> 0, -row=> 5, -sticky => "w", -padx => 20, -pady => 5);
my $click = $page2->new_ttk__button(-width => 10, -text => "Click me!", -command => sub {basicanswer()});
$click->g_grid(-column => 0, -row => 6, -sticky => "w", -padx => 20, -pady => 5);
my $see = $page2->new_ttk__entry(-textvariable=> \$eighteen, -width=> 30);
$see->g_grid(-column => 0, -row => 6);

sub basicanswer {
	if ($choice1->state) {
		$eighteen = "Correct!!!";
		my $zero1 = $page2->new_ttk__label(-image=> "zeroimg")->g_grid(-column => 0, -row => 7, -rowspan => 3, -sticky => "e");
		my $one1 = $page2->new_ttk__label(-image=> "oneimg")->g_grid(-column => 1, -row => 7, -rowspan => 3);
	} else {
		$eighteen = "Incorrect, please try again...";
		Tkx::image_create_photo("zeroimg1", -file => "zero1.gif");
		my $zero1 = $page2->new_ttk__label(-image=> "zeroimg1")->g_grid(-column => 0, -row => 7, -sticky => "e");
		Tkx::image_create_photo("oneimg1", -file => "one1.gif");
		my $one1 = $page2->new_ttk__label(-image=> "oneimg1")->g_grid(-column => 1, -row => 7);	
	}
}

#Tab3
#Title
my $title3 = $page3->new_ttk__label( -text => "How to add in Binary", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 3, -pady => 20);

#Text
my $text = $page3->new_ttk__label(-text=> "Let's start with me. When adding \ntwo of me, I know I need to grow, \nbut I'm afraid to do so.  So I \nwill remain Zero.  Now One will \ntell his story.");
$text->g_grid( -column => 0, -row => 2, -padx => 20, -pady => 20, -sticky => "n");

my $text1 = $page3->new_ttk__label(-text => "Now it's my turn.  When adding two of me, I know I need to grow, but \nI'm the biggest digit around, so I have to get creative.  

I can't stay a One, so I become Zero.  But the other One gets carried over \nnext to Zero and we become best friends.  Therefore, One plus One \nin binary equals 10, which for you decimal folks, is equal to 2. 

Now lets talk about adding One and Zero together.");
$text1->g_grid( -column=> 1, -row => 2, -padx => 20, -pady=> 20, -sticky => "nwes");

my $text2 = $page3->new_ttk__label(-text => "So, when adding One and Zero, Zero refuses to change and One is waiting \nto grow, so therefore, we'll remain as One. Adding our paired friends Ten to \nOne, we see that One is more willing to be with the other One than its \noriginal friend Zero, there, Ten plus One in binary equals 11, which for \nyou decimal folks, is equal to 3.");
$text2->g_grid( -column=> 0, -row => 4, -padx => 20, -pady=> 20, -columnspan => 2, -sticky => "nwes");

my $zero2 = $page3->new_ttk__label(-image => "zeroimg")->g_grid(-column => 0, -row => 3, -sticky => "s");
my $one2 = $page3->new_ttk__label(-image => "oneimg")->g_grid(-column => 1, -row => 3, -sticky => "s");

#Tab4 - Adding Exercise
#Title
my $try = $page4->new_ttk__label( -text => "Try it yourself", -font=> "TitleFont")->g_grid(-column => 0, -row => 0, -columnspan => 3, -pady => 10);

#Example
my $example = $page4->new_ttk__label( -text => "Example:       1010\n\t +  1111\n\t ______", -font => "HeaderFont"
)->g_grid(-column => 0, -row => 1, -sticky => "w", -padx => 25);

#Button
my $answerbutton = $page4->new_ttk__button(-text => "Click to see Answer", -command => sub{answer()});
$answerbutton->g_grid(-column => 0, -row => 3, -sticky => "w", -padx => 100, -pady => 20);
sub answer { $bin = 10001 }

#Answer
my $field = $page4->new_ttk__entry(-width => 6, -textvariable => \$bin, -justify=> "right", -font=> "HeaderFont");
$field->g_grid(-column => 0, -row => 2, -sticky => "w", -padx => 120);

#Canvas Title
my $pad = $page4->new_ttk__label (-text => "Use the sketchpad below to assist you if you need it!")->g_grid(-column => 0, -row => 4, -columnspan => 2, -pady=> 10, -padx => 40);

#Canvas
my $canvas = $page4->new_tk__canvas(-scrollregion => "0 0 0 0", -width => 600, -height => 300, -bg => "white", -bd => 10, -relief => "groove");
$canvas->g_grid(-column=> 0, -row=> 5, -columnspan => 2, -padx=> 20);
$canvas->g_bind("<1>", [sub {my ($x,$y) = @_; $lastx=$canvas->canvasx($x); $lasty=$canvas->canvasy($y)}, Tkx::Ev("%x","%y")]);
$canvas->g_bind("<B1-Motion>", [sub {my ($x,$y) = @_; addLine($canvas->canvasx($x),$canvas->canvasy($y))}, Tkx::Ev("%x","%y")]);
$canvas->g_bind("<B1-ButtonRelease>", sub {doneStroke();});
$id = $canvas->create_rectangle(10, 35, 30, 55, -fill => "white", -tags => "palette palettewhite");
$canvas->bind($id, "<1>", sub {setColor("white")});
$id = $canvas->create_rectangle(10, 60, 30, 80, -fill => "black", -tags => "palette paletteblack paletteSelected");
$canvas->bind($id, "<1>", sub {setColor("black")});

sub setColor {
    my ($newcolor) = @_;
    $color = $newcolor;
    $canvas->dtag_all("paletteSelected");
    $canvas->itemconfigure("palette", -outline => "black");
    $canvas->addtag("paletteSelected", withtag => "palette".$color);
    $canvas->itemconfigure("paletteSelected", -outline => "#999999");
}
setColor "black";
#$canvas->itemconfigure("palette", -width => 5);

sub addLine {
    my ($x,$y) = @_;
	if ($color eq "white") {
    $canvas->create_line($lastx,$lasty,$x,$y, -fill => $color, -width => 20, -tags => "currentline");
	} else {
	$canvas->create_line($lastx,$lasty,$x,$y, -fill => $color, -width => 5, -tags => "currentline");
	}
	$lastx = $x; $lasty = $y;
}
sub doneStroke {
	if ($color eq "white") {
		$canvas->itemconfigure("currentline", -width =>20);
	} else {
		$canvas->itemconfigure("currentline", -width =>2);
	}
}

#Run program
Tkx::MainLoop();


