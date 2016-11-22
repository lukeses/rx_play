require 'bundler/setup'
Bundler.require


# Play with range!
start = 10
source = Rx::Observable.timer(1, 1).map{ |i| start - i }.take(start +1)

subscription = source.subscribe(
    lambda {|x|
        puts 'Next: ' + x.to_s
    },
    lambda {|err|
        puts 'Error: ' + err.to_s
    },
    lambda {
        puts 'Your mission is completed!'
    })

while Thread.list.size > 1
    (Thread.list - [Thread.current]).each &:join
end
