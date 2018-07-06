# Author: Aiden Nelson
# Date: 7/2/2018
# Description: Luhn's Algorithm implemented as a perl subroutine.
# Function will return 1 if the card does not pass Luhns Algorithm, otherwise 0 will be returned.

sub luhn {
	my $sum = 0;
	my $number = shift;	
	my @digits = $number =~ /\d{1}/g;	# Split number into an array of digits.
	my $checkDigit = pop @digits;		# Copy last digit.
	@digits = reverse @digits;			# Reverse order of digits.
	for ($i = 0; $i < @digits; $i++) {	# Apply step 1 of algorithm.
		if ($i % 2 == 0) {
			$digits[$i] *= 2;
			if ($digits[$i] > 9) {
				$digits[$i] -= 9;
			}
		}
		$sum += $digits[$i];
	}
	if (($sum * 9) % 10 != $checkDigit) {	# Send positive if the calculated check digit does not match the original last digit.
		return 1;
	}
	return 0;
}

print "\n\n";
print luhn(@ARGV);