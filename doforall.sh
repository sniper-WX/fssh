if [ $# == 2 ]
then
    cmd=$1
    hostfile=$2
elif [ $# == 1 ]
then
    cmd=$1
    hostfile='hosts'
else
    echo 'usage:doforall.sh command_string'
    echo 'usage:doforall.sh command_string host_file_path'
    exit 1
fi

for x in `cat $hostfile | sed "/^#.*/d"`
do
    echo $x result:
    ssh $x $cmd
done
