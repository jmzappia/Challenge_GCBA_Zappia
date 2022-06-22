##
##	Reset: Clean the input, output and results , directories content, of
##	a specified cmdlet
##	Parameter 1: a string containing the scenario number to remove
##

if($args.Count > 0)
{

$i = '../Input/' + $args[0]
$o = '../Input/' + $args[0]
$r = '../Results/' + $args[0] + '*'

rm -Recurse $i
rm -Recurse $o
rm -Recurse $r

}
else
{
	"scenario number is missing"
}