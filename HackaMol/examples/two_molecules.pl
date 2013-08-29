use Modern::Perl;
use lib 'lib','t/lib';
use HackaMol::Molecule;
use PDBintoAtoms qw(readinto_atoms);
use Math::Vector::Real;


my @atoms1 = readinto_atoms("t/lib/1L2Y.pdb");
my $mol1 = Molecule->new(name=> 'trp-cage', atoms=>[@atoms1]);
my @atoms2 = readinto_atoms("t/lib/2cba.pdb");
my $mol2 = Molecule->new(name=> 'CAII', atoms=>[@atoms2]);
my $mol3 = Molecule->new(name=> 'both', atoms=>[@atoms1,@atoms2]);

$mol1->translate(-$mol1->COM);
$mol2->translate(-$mol2->COM+V(30,0,0));
$mol3->print_xyz;
foreach (1 .. 360){
  $mol1->rotate(V(1,1,1), 1, $mol2->COM);
  $mol1->rotate(V(1,1,1), 1, $mol1->COM);
  $mol3->print_xyz;
}  

