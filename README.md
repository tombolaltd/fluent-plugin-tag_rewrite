[<img src="https://badge.fury.io/rb/fluent-plugin-tag_rewrite.png" alt="Gem Version" />](http://badge.fury.io/rb/fluent-plugin-tag_rewrite)
# fluent-plugin-tag_rewrite

#### Overview

Rewrite tag for [Fluentd](https://www.fluentd.org). It is designed to rewrite the tags and re-emit the record with rewrited tag. Value can only be added at the start or the end of the tag.

This is an output plugin because fluentd's filter doesn't allow tag rewrite.

#### Installation

    gem install fluent-plugin-tag_rewrite

#### Configuration

    <match **>
      @type tag_rewrite
      tag_prefix start
      tag_sufix end
    </match>
   
 Optional parameter is either tag_prefix or tag_sufix

#### Example 
  If your fluentd match configuration is the same as above followed by the match configuration like this:
 
    <match start.fluent.**>
      @type stdout
    </match> 
    
  The output will be:
  
    | original record                       | rewritten tag record                            |
    |---------------------------------------|-------------------------------------------------|
    | fluent.warn {"message":"[info]: ..."} | start.fluent.warn.end {"message":"[info]: ..."} |

## Requirements

| fluent-plugin-tag_rewrite | fluentd |
|-------------------|---------|
| >= 1.0.0 | >= v1.0.0 < 2 |

#### Contributing

1. Fork it ( http://github.com/tombolaltd/fluent-plugin-tag_rewrite/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

#### Copyright

Copyright (c) 2019 - [tombola](https://www.tombolaarcade.co.uk).

#### License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
