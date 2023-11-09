
hi there.

you'll have the opportunity to complete my code and make a loop which will find out if number received from keyboard is prime or not.

as usually, i have comments in the assembly file.
so the program will suggest you to input a number from console.
we use scanf function to read it.
it is stored to variable x.
then we calculate square root of x and store it in sroot variable.
check how, if you want.

so you need to write a loop
which starts from 2 or 3 and till that square root.

something like this:
```
def isprime(num):
    if num > 1:
        for i in range(2, int(num ** 0.5) + 1):
            if num % i == 0:
                return False
        return True
```

remember, you already have the number in x and square root in sroot.

then instead of returnig False or True like in this code
you just call write_yes or write_no functions we already prepared for you.

take care and have fun.


