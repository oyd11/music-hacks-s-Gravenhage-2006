#!/usr/bin/perl
#
# a 'MIDI::Simple'
# 12-tone 'jazzy' sketch.
# quick (or not so quick) n dirty :9
#
# pretty much 'sequenced', with abit of xforms to make life easier.
#
# `Oyd11

# 12 tone xlate:

#  0  1  2  3  4  5  6  7  8  9  a  b
# -0 -b -a -9 -8 -7 -6 -5 -4 -3 -2 -1


###
# -0 -b -a -9 -8 -7 -6 -5 -4 -3 -2 -1

#@bassl1 = ( 0,-1,-7,-6,-5,-4,2,-3,-2,3,1,4 );
#        >> 0 -11-5 -6 -7 -8...


use MIDI;

my $out = 'take1.mid';
my $bak = $out . '~';
-e $bak and unlink $bak;
-e $out and rename $out,$bak;

srand; ## init seed

@bassl0 = ( 0,-1,-7,-6,-5,-4,2,-3,-2,3,1,4 );
$base=44;

no strict;
use MIDI::Simple;
new_score;
@Score = ();
text_event 'tst1/ OyD11^TPR';
set_tempo 350000;  # 1 qn => .5 seconds (500,000 microseconds)
patch_change 1, 0;  # Patch 0 = Piano
patch_change 2, 32;  # Patch 32 = Acoustic Bass
patch_change 3, 0;  # JX-1 => piano
patch_change 5, 0; 

$box=-1;


$bassItr0= lineItr(0,0); # iterator from 0, Prime
# [0 == Prime, 1 == Inv, 2 == R, 3 == RI ]
$pnItr0= lineItr(0,0); # iterator from 0, Prime

@subs = ( \&count,
		\&bass0,
		\&dr0,
	);
foreach (1 .. 5) { synch(@subs)}

## @bassl0 = ( 0,-1,-7,-6,-5,-4,2,-3,-2,3,1,4 );
@chord1=(2,3,6,7,10,11);
@chord2=(1,2,4,6,7,11);

@chord1=@bassl0[0..5]; # (0,-1,-7,-6,-5,-4)
@chord2=@bassl0[6..11]; # (2,-3,-2,3,1,4)

@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&chordsw,
	);
synch(@subs);
@chord1=@bassl0[6..11]; # (0,-1,-7,-6,-5,-4)
synch(@subs);

@chord1=(0,-1,-7+12,-6+12,-5+12,-4+12); # same chords
@chord2=(2+12,-3,-2,3+12,1,4+12);
@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&chordsq,
	);
synch(@subs);
@chord2=(0,-1,-7+12,-6+12,-5+12,-4+12); # same chords
@chord1=(2+12,-3,-2,3+12,1,4+12);
synch(@subs);

#  0  1  2  3  4  5  6  7  8  9  a  b
# -0 -b -a -9 -8 -7 -6 -5 -4 -3 -2 -1
@chord1=(0,3,5,-2,-3,-4);
@chord2=(1,2,3,-1,-5,-6);
synch(@subs);


@chord1=(0,-1,-7+12,-6+12,-5+12,-4+12);
@chord2=(2+12,-3,-2,3+12,1,4+12);

@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&chordsq2,
	);
synch(@subs);
@chord2=(0,-1,-7+12,-6+12,-5+12,-4+12);
@chord1=(2+12,-3,-2,3+12,1,4+12);
synch(@subs);


@subs = ( \&count,
		\&bass0,
		\&chordsq3,
		\&dr0,
	);
@chord1=@bassl0[0..5]; # (0,-1,-7,-6,-5,-4)
@chord2=@bassl0[6..11]; # (2,-3,-2,3,1,4)
synch(@subs);
@chord2=@bassl0[0..5]; # (0,-1,-7,-6,-5,-4)
@chord1=@bassl0[6..11]; # (2,-3,-2,3,1,4)
synch(@subs);
@chord1=(2+12,-3,-2,3+12,1,4+12);
@chord2=(4,2,6,12,10,8);
synch(@subs);

@subs = ( \&count,
		\&bass1,
		\&dr0,
	);
synch(@subs);

@subs = ( \&count,
		\&bass2,
		\&pn2,
		\&dr0,
	);
synch(@subs);
synch(@subs);
synch(@subs);

#synch(@subs);

@subs = ( \&count,
		\&bass1,
		\&dr0,
	);

synch(@subs);
@subs = ( \&count,
		\&bass1,
		\&dr0,
		\&pn1,
	);

synch(@subs);
synch(@subs);
synch(@subs);
synch(@subs);
@subs = ( \&count,
		\&bass2,
		\&dr0,
	);

synch(@subs);

patch_change 3, 29+32;  # JX-1 => 'sweep'
@subs = ( \&count,
		\&bass2,
		\&dr0,
		\&pn0,
	);
synch(@subs);
@subs = ( \&count,
		\&bass1,
		\&dr0,
		\&pn0,
	);
synch(@subs);
synch(@subs);
#synch(@subs);
@subs = ( \&count,
		\&bass1,
		\&dr0,
		\&pn0,
	);
synch(@subs);
@subs = ( \&count,
		\&bass1,
		\&dr0,
		\&pn3,
	);
synch(@subs);
@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&pn3,
	);
synch(@subs);
@subs = ( \&count,
		\&bass1,
		\&dr0,
		\&pn3,
	);
synch(@subs);
@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&pn3,
	);
synch(@subs);
synch(@subs);
synch(@subs);
synch(@subs);
synch(@subs);
@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&chordsw,
	);
@chord1=(0,-1,-7+12,-6+12,-5+12,-4+12); # same chords
@chord2=(2+12,-3,-2,3+12,1,4+12);

@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&chords0,
	);
synch(@subs);
@chord2=(0,-1,-7+12,-6+12,-5+12,-4+12); # same chords
@chord1=(2+12,-3,-2,3+12,1,4+12);
@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&chordsR,
	);

patch_change 3, 0;  # JX-1 => piano
synch(@subs);
@chord1=(0,-1,-7+12,-6+12,-5+12,-4+12); # same chords
@chord2=(2+12,-3,-2,3+12,1,4+12);

@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&chordsR2,
	);
synch(@subs);
@chord2=(0,-1,-7+12,-6+12,-5+12,-4+12); # same chords
@chord1=(2+12,-3,-2,3+12,1,4+12);
synch(@subs);
synch(@subs);
@subs = ( \&count,
		\&bass0,
		\&dr0,
		\&chordsR,
	);
synch(@subs);
synch(@subs);
@subs = ( \&count,
#		\&bass0,
#		\&dr0,
		\&chordsR2,
	);
synch(@subs);
synch(@subs);

write_score $out;
exit;

# -------- End of Main --------

sub count {
		my $it = shift;   $it->r(wn); # a whole rest
				++$box;
		$r4=int(rand(4));
}

sub dr0 {
		noop c9, f, o3;  # Setup
				my $it = shift;
		for ($i=0; $i<8; ++$i) {
		my $modl=(($box / 3 ) %3) == 0 ?
				5 : 3;
		if (($i % $modl) == 0) {
				$it->n(en,42); # 42 closedHH 44 pedalHH, 46 openHH
#		$it->n(en,76); # 42 closedHH 44 pedalHH, 46 openHH
		} else {
				$it->n(en,46); # 42 closedHH 44 pedalHH, 46 openHH
#		$it->n(en,77); # 42 closedHH 44 pedalHH, 46 openHH
		}
#	}
		}
}

sub bass0 {
		my $it = shift;
		noop c2, f, o3;  # Setup
		for ($i=0; $i<8; ++$i) {
			if (($i % 3) == 0) {
				noop V117;
			} else {
				noop V90;
			}
			my $note=$bassItr0->();
			$it->n(en, $base + $note);
		}
}

sub bass1 {
		my $it = shift;
		noop c2, f, o3;  # Setup
		noop V117;
		for ($i=0; $i<4; ++$i) {
			my $note=$bassItr0->();
			$it->n(qn, $base + $note);
			noop V79;
		}
}
sub bass2 {
		my $it = shift;
		noop c2, f, o3;  # Setup
		noop V117;
		my $note=$bassItr0->();
		for ($i=0; $i<4; ++$i) {
			$it->n(qn, $base + $note);
			noop V79;
		}
}

sub lineItr {
		my ($i,$form)=@_;
		my $newbase=$base;

		return sub {
				my $ret;
				if ($form==0) {
						$ret= $bassl0[$i];
				} elsif ($form==1) {
						$ret= - $bassl0[$i];
				} elsif ($form==2) {
						$ret= $bassl0[-$i];
				} elsif ($form==3) {
						$ret= -$bassl0[-$i];
				}

				if ($newbase!=$base) {
						$base=$newbase;
				}
				if (++$i==12) {
						++$form; $i=0;
						if ($form==4) {
							$form = 0;
							$qq=int(rand(8))-5;
							$newbase += $qq; ## choose new base for next time
								if ($newbase<30 || $newbase>46) {
									$newbase=int(rand(14))+32;
								}
							}
				}

				return $ret;
		}
}

sub chords0 {
		my $it = shift;
		noop c3, V90,f, o3; # Piano channel
#		noop c5, V90,f, o3;
		my $chordb=$base+24;
		# play two hexachords
		$it->n(ddqn, $chordb + $chord1[0], $chordb+$chord1[1],
			$chordb+ $chord1[2],$chordb+ $chord1[3],
			$chordb+$chord1[4],$chordb+ $chord1[5]);
		$it->r(sn);
		$it->n(ddqn, $chordb + $chord2[0], $chordb+$chord2[1],
			$chordb+ $chord2[2],$chordb+ $chord2[3],
			$chordb+$chord2[4],$chordb+ $chord2[5]);
		$it->r(sn);
}

sub chordsw {
		my $it = shift;
		noop c3, V90,f, o3; # Piano channel
#		noop c5, V90,f, o3;
		my $chordb=$base+24;
		$it->n(tqn, $chordb + $chord1[0], $chordb+$chord1[1],
			$chordb+ $chord1[2],$chordb+ $chord1[3],
			$chordb+$chord1[4],$chordb+ $chord1[5]);
		$it->r(ten);
}

sub chordsq {
		my $it = shift;
		noop c3, V90,f, o3; # Piano channel
#		noop c5, V90,f, o3;
		my $chordb=$base+24;
		# play two hexachords
		$it->n(tqn, $chordb + $chord1[0], $chordb+$chord1[1],
			$chordb+ $chord1[2],$chordb+ $chord1[3],
			$chordb+$chord1[4],$chordb+ $chord1[5]);
		# 1/3 left == 32 ticks (whole==96)
		$it->r(d8);
		$it->n(d4,$chordb + $chord2[0]);
		$it->n(d4,$chordb + $chord2[1]);
		$it->n(d4,$chordb + $chord2[2]);
		$it->n(d4,$chordb + $chord2[3]);
		$it->n(d4,$chordb + $chord2[4]);
		$it->n(d4,$chordb + $chord2[5]);
}

sub chordsq2 {
		my $it = shift;
		noop c3, V90,f, o3; # Piano channel
#		noop c5, V90,f, o3;
		my $chordb=$base+24;
		# play two hexachords
		$it->n(tqn, $chordb + $chord1[0], $chordb+$chord1[1],
			$chordb+ $chord1[2],$chordb+ $chord1[3],
			$chordb+$chord1[4],$chordb+ $chord1[5]);
		# 1/3 left == 32 ticks (whole==96)
		$it->r(d8);
		$it->n(d4,$chordb + $chord2[0]);
		$it->n(d4,$chordb + $chord2[1]);
		$it->n(d4,$chordb + $chord2[2]);
		$it->n(d4,$chordb + $chord2[3]);
		$it->n(d4,$chordb + $chord2[4]);
		$it->n(d4,$chordb + $chord2[5]);

		$it->r(d62);
		$it->n(tqn, $chordb + $chord2[0], $chordb+$chord2[1],
			$chordb+ $chord2[2],$chordb+ $chord2[3],
			$chordb+$chord2[4],$chordb+ $chord2[5]);
}

sub chordsq3 {
# there seems to be 192 ticks in a 'whole'
		my $it = shift;
		noop c3, V90,f, o3; # Piano channel
#		noop c5, V90,f, o3;
		my $chordb=$base+24;
		# play two hexachords
		$it->n(d48, $chordb + $chord1[0], $chordb+$chord1[1],
			$chordb+ $chord1[2],$chordb+ $chord1[3],
			$chordb+$chord1[4],$chordb+ $chord1[5]);
		# 1/3 left == 32 ticks (whole==96)
		$it->r(d16);
		$it->n(d20,$chordb + $chord2[0]);
		$it->r(d4);
		$it->n(d16,$chordb + $chord2[1]);
		$it->r(d4);
		$it->n(d16,$chordb + $chord2[2]);
		$it->r(d4);
		$it->n(d16,$chordb + $chord2[3]);
		$it->r(d4);
		$it->n(d16,$chordb + $chord2[4]);
		$it->r(d4);
		$it->n(d16,$chordb + $chord2[5]);
		$it->r(d4);

}

sub pn0 {
		my $it = shift;
		$pnBase=$base+12;
		noop c3, f, o3;  # Piano
		for (1 .. 16)  {
				my $note=$pnItr0->();
				$it->n(d16, $pnBase + $note);
		}
}

sub pn1 {
		my $it = shift;
		$pnBase=$base+24;
		noop c3, f, o3;  # Piano
		for (1 .. 8)  {
				my $note=$pnItr0->();
				$it->n(d32, $pnBase + $note);
		}
}

sub pn2 {
		my $it = shift;
		$pnBase=$base+24;
		noop c3, f, o3;  # Piano
		my $note=$pnItr0->();
		$it->n(d24, $pnBase + $note);
		for (1..4) {
				$note=$pnItr0->();
				$it->n(d6, $pnBase + $note);
		}
		for (5..11) {
				$note=$pnItr0->();
				$it->n(d22, $pnBase + $note);
				$it->r(d2);
		}
}


sub pn3 {
		my $it = shift;
		$pnBase=$base+12;
		noop c3, f, o3;  # Piano
		my $note=$pnItr0->();
		$it->n(wn, $pnBase + $note);
}

sub chordsR {
		my $it = shift;
		noop c3, V90,f, o3; # Piano channel
#		noop c5, V90,f, o3;
		my $chordb=$base+12;
		# play two hexachords
		for ($i=0; $i<8; ++$i) {
			if ($i%3==0) {
					$it->n(en, $chordb + $chord1[0], $chordb+$chord1[1],
							$chordb+ $chord1[2],$chordb+ $chord1[3],
							$chordb+$chord1[4],$chordb+ $chord1[5]);
			} else {
					$chordb+=12;
					$it->n(en, $chordb + $chord2[0], $chordb+$chord2[1],
							$chordb+ $chord2[2],$chordb+ $chord2[3],
							$chordb+$chord2[4],$chordb+ $chord2[5]);
					$chordb-=12;
			}
		}

}

sub chordsR2 {
		my $it = shift;
		noop c3, V90,f, o3; # Piano channel
#		noop c5, V90,f, o3;
		my $chordb=$base+24;
		# play two hexachords
		for ($i=0; $i<8; ++$i) {
			if ($i%3==0 || $i%5==0) {
					$chordb-=12;
					$it->n(en, $chordb + $chord1[0], $chordb+$chord1[1],
							$chordb+ $chord1[2],$chordb+ $chord1[3],
							$chordb+$chord1[4],$chordb+ $chord1[5]);
					$chordb+=12;
			} else {
					$it->n(sn, $chordb + $chord2[0], $chordb+$chord2[1],
							$chordb+ $chord2[2],$chordb+ $chord2[3],
							$chordb+$chord2[4],$chordb+ $chord2[5]);
					$it->n(sn, $chordb + $chord2[0], $chordb+$chord2[1],
							$chordb+ $chord2[2],$chordb+ $chord2[3],
							$chordb+$chord2[4],$chordb+ $chord2[5]);
			}
		}

}
