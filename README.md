# bitcoin-miner
The goal of this first project is to use Erlang and the Actor Model to build a good solution to the bitcoin mining problem that runs well on multi-core machines. By simultaneously executing our code on 3 computers, one of which functioned as the host and the other 2 served as the remotes, we were able to create a coin with 6 leading zeroes.

SIZE OF THE WORK UNIT -
The worker in this software receives a request to mine without a limit on the number of coins that may be taken out. We create 2*logproc worker processes/nodes to mine bitcoins, where logproc is the total number of logical processors that a machine is capable of supporting. Additionally, we keep an eye on each worker process separately and restart them if necessary.

SAMPLE OUTPUT -
The following output was generated when input was 4:

![unnamed](https://user-images.githubusercontent.com/64377125/192152807-663df508-ad75-464d-9e27-531437a3dc10.png)

RUNNING TIME -

real -> 45ms

cpu -> 160ms

COIN WITH MOST ZEROES -

![unnamed](https://user-images.githubusercontent.com/64377125/192152861-e5c8e79b-468e-4ee8-a3e1-5bcefa303186.jpg)

We yielded bitcoin with 6 leading zeroes.

LARGEST NUMBER OF WORKING MACHINES ON WHICH THE CODE WAS RUN -
The code was executed concurrently on 3 computers, one of which served as the host while the other 2 served as the remotes.

This was my first project as a UF Grad student, and it was really fun. ;)
