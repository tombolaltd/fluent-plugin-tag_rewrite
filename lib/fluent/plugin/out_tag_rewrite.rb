require "fluent/plugin/output"

class Fluent::Plugin::TagRewriteOutput < Fluent::Plugin::Output
  Fluent::Plugin.register_output("tag_rewrite", self)

  helpers :event_emitter

  config_param :tag_prefix, :string, :default => nil
  config_param :tag_sufix, :string, :default => nil

  def configure(conf)
    super

    if @tag_prefix.nil? && @tag_prefix.nil?
      raise Fluent::ConfigError, "tag_prefix or tag_sufix has not been provided"
    end
  end

  def multi_workers_ready?
    true
  end

  def process(tag, es)
    es.each do |time, record|
      begin
        rewrited_tag = tag
        unless @tag_prefix.nil?
          rewrited_tag = @tag_prefix + "." + rewrited_tag
        end
        unless @tag_sufix.nil?
          rewrited_tag = rewrited_tag + "." + @tag_sufix
        end
        router.emit(rewrited_tag, time, record)
      rescue
        $log.error("unexpected error in append_tag", :error => $!.to_s)
        $log.error_backtrace
      end
    end
  end
end
