# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

require "command-builder"

##
# Main EventMachine module.
# @see http://rubyeventmachine.com/
#

module EM

    ##
    # Evented FileUtils.
    #

    module FileUtils

        ##
        # Commands instances cache.
        #
        
        @@cache = { }

        ##
        # Copy object using +cp -r+ command.
        #
        # @param [String] from source path
        # @param [String] to target path
        # @return [CommandBuilder] the command builder object
        # 

        def self.cp(from, to)
            cmd = __get(:cp)
            cmd << :r
            cmd << from
            cmd << to
            cmd
        end

        ##
        # Renames object using +mv+ command.
        #
        # @param [String] from source path
        # @param [String] to target path
        # @return [CommandBuilder] the command builder object
        # 
        
        def self.mv(from, to)
            cmd = __get(:mv)
            cmd << from
            cmd << to
            cmd
        end
        
        ##
        # Removes object using +rm -r+ command.
        #
        # @param [String] path path to file
        # @return [CommandBuilder] the command builder object
        # 
        
        def self.rm(path)
            cmd = __get(:rm)
            cmd << :r
            cmd << path
            cmd
        end
        
        ##
        # Touches file using +touch+ command.
        #
        # @param [String] path to the file
        # @return [CommandBuilder] the command builder object
        #
        
        def self.touch(path)
            cmd = __get(:touch)
            cmd << path
            cmd
        end
        
        ##
        # Creates directory using +mkdir -p+ command.
        #
        # @param [String] directory path
        # @return [CommandBuilder] the command builder object
        #
        
        def self.mkdir(path)
            cmd = __get(:mkdir)
            cmd << :p
            cmd << path
            cmd
        end 

        
        private
        
        ##
        # Returns instance of command builder from cache.
        #
        
        def self.__get(command)
            command = command.to_sym
            
            if @@cache.include? command
                command = @@cache[command]
                command.reset!  # returns
            else
                @@cache[command] = CommandBuilder::new(command)
            end
        end
        
    end
end
