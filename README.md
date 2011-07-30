EventMachine FileUtils
======================

**em-file-utils** allows base file operations using UNIX commands such 
as standard library [FileUtils][1], but returns [CommandBuilder][2] 
objects which allows wide customizations to final call and asynchronous 
evented [EventMachine][3] interface support (although it isn't required). 
[UNIX][4]/[GNU][5] based systems only are supported. 

Some example:

    # synchronous
    require "em-file-utils"
    output = EM::FileUtils::touch("./~test1").execute!
    
    # asynchronous
    EM::run   # eventmachine
        EM::FileUtils::touch("./~test1").execute do |output|
            # ...
        end
    end
    
It returns [CommandBuilder][2] object which allows it to be flexible:
    
    cmd = EM::FileUtils::touch("./~test1")
    cmd.params.unshift(:a)      # change access time only 
    cmd.execute!
    
Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][9] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.


Copyright
---------

Copyright &copy; 2011 [Martin Kozák][10]. See `LICENSE.txt` for
further details.

[1]: http://ruby-doc.org/stdlib/libdoc/fileutils/rdoc/classes/FileUtils.html
[2]: http://github.com/martinkozak/command-builder
[3]: http://rubyeventmachine.com/
[4]: http://en.wikipedia.org/wiki/Unix
[5]: http://en.wikipedia.org/wiki/GNU
[9]: http://github.com/martinkozak/em-file-utils/issues
[10]: http://www.martinkozak.net/
