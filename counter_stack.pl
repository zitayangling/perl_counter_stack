
use Stack;
use strict;
my $stack_one = Stack->new(100);
my @array = qw/10 + 2 * ( 15 - 10 ) * 2/;
my @hou_array = ();
my $number = 0;
for (my $i = 0; $i <= $#array; $i++) 
{	
	my $str = $array[$i];
	if ($str =~ /\d+/)
	{
		$hou_array[$number] = $str;	
		$number++;
	}
	elsif($str eq "(")
	{
		$stack_one ->push($str);
	}
	elsif($str eq "+" || $str eq "-")
	{
		my $top = $stack_one->top;
		my $num = $stack_one->size;
		if ($top eq "*" || $top eq "/" || $top eq "%") {
			for (my $i = 0; $i < $num; $i++) {
				my $string = $stack_one->pop;
				$hou_array[$number] = $string;
				$number++; 	
			}
			$stack_one->push($str);
		}elsif($top eq "+" || $top eq "-")
		{
			my $string = $stack_one->pop;
			$stack_one->push($str);
			$hou_array[$number] = $string;
			$number++;
		}
		else
		{
			$stack_one->push($str);
		}
	}
	elsif($str eq "*" || $str eq "/" || $str eq "%")
	{
		my $top = $stack_one->top;
		if ($top eq "+" || $top eq "-") {
			$stack_one->push($str);
		}elsif($top eq "*" || $top eq "/" || $top eq "%")
		{
			my $string = $stack_one->pop;
			$stack_one->push($str);
			$hou_array[$number] = $string;
			$number++
			
		}else{
			$stack_one->push($str);
		}	
	}
	elsif($str eq ")")
	{
		my $index = $stack_one->size;

		for (my $i = 0; $i < $index; $i++) 
		{
			my $top = $stack_one->top;
			if($top eq "(") 
			{
				$stack_one->pop;
				last;
			}
			else{
				my $string = $stack_one->pop;
				$hou_array[$number] = $string;
				$number++;
			}
		}
	}
	else
	{
		print "error\n";
	}
	if($i == $#array)
	{
		my $index = $stack_one->size;
		for (my $i = 0; $i < $index; $i++)
		{
			my $string = $stack_one->pop;
			$hou_array[$number] = $string;
			$number++;
		}
	}
}
foreach(@hou_array)
{
	print "$_";
}


my $stack = Stack->new(100);

for (my $i = 0; $i <= $#hou_array; $i++) 
{
	my $str = $hou_array[$i];
	
	if ($str =~ /\d+/) {
		$stack->push($str);
	}
	elsif($str eq "+")
	{
		my $num1 = $stack->pop;
		my $num2 = $stack->pop;
		my $num3 = $num2 + $num1;
		$stack->push($num3);
	}elsif($str eq "-")
	{
		my $num1 = $stack->pop;
		my $num2 = $stack->pop;
		my $num3 = $num2 - $num1;
		$stack->push($num3);
	}
	elsif($str eq "/")
	{
		my $num1 = $stack->pop;
		my $num2 = $stack->pop;
		my $num3 = $num2 / $num1;
		$stack->push($num3);
	}
	elsif($str eq "*")
	{
		my $num1 = $stack->pop;
		my $num2 = $stack->pop;
		my $num3 = $num2 * $num1;
		$stack->push($num3);
	}
	elsif($str eq "%")
	{
		my $num1 = $stack->pop;
		my $num2 = $stack->pop;
		my $num3 = $num2 % $num1;
		$stack->push($num3);
	}
	else{
		print "Sorry!Input error!\n";
	}

}
printf "this num = %d\n",$stack->top;