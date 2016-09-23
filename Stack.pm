package Stack;
use strict;
sub new {
	my ($class, $max_size) = @_;
	my @array = ();
	$#array = $max_size;
	my $self = {
		current_size  => 0,
		max_size => $max_size,
		array => @array,
	};
	bless($self, $class);
	return $self;
}
sub size {
	my $self = shift;
	my $num = $$self{"current_size"};
	if($num < 0)
	{
		return 0;
	}
	return $num;
}
sub push {
	my ($self,$data) = @_;
	my $index = $$self{"current_size"};
	# print "push = $data\n";
	if ($index >= $$self{"max_size"})
	{
		&full;
	} 
	$$self{"array"}[$index] = $data;
	$$self{"current_size"} = $index + 1;
	return $data;
}
sub pop {
	my $self = shift;
	my $index = $$self{"current_size"};
	if ($index <= 0) {
		&empty;
	}
	my $data = $$self{"array"}[$index-1];
	$$self{"array"}[$index-1] = undef;
	# print "pop = $data\n";
	$$self{"current_size"} = $index - 1;

	return $data;
}
sub empty 
{ 
	die "this stack is empty!\n";
}
sub full 
{	
	die "this stack is full!\n";			
}
sub top{
 	my $self = shift;
 	my $index = $$self{"current_size"};
 	if ($index <= 0) {
 		return undef;
 	}
 	my $data = $$self{"array"}[$index-1];
 	return $data;
}
1;