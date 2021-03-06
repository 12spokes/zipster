require 'algorithms'

module Zipster
  MAPPINGS = {
        "AA" => ['340'],
        "AE" => ['090'..'098'],
        "AK" => ['995'..'999'],
        "AL" => ['350'..'352','354'..'369'],
        "AP" => ['962'..'966'],
        "AR" => ['716'..'729'],
        "AZ" => ['850'..'865'],
        "CA" => ['900'..'961'],
        "CO" => ['800'..'816'],
        "CT" => ['060'..'069'],
        "DC" => ['200','202'..'205','569'],
        "DE" => ['197'..'199'],
        "FL" => ['320'..'339','341','342','344','346','347','349'],
        "GA" => ['300'..'319','398','399'],
        "GU" => ['969'],
        "HI" => ['967','968'],
        "IA" => ['500'..'516','520'..'528'],
        "ID" => ['832'..'838'],
        "IL" => ['600'..'620','622'..'629'],
        "IN" => ['460'..'479'],
        "KS" => ['660'..'679'],
        "KY" => ['400'..'418','420'..'427'],
        "LA" => ['700'..'714'],
        "MA" => ['010'..'027','055'],
        "MD" => ['206'..'212','214'..'219'],
        "ME" => ['039'..'049'],
        "MI" => ['480'..'499'],
        "MN" => ['550','551','553'..'567'],
        "MO" => ['630'..'658'],
        "MS" => ['386'..'397'],
        "MT" => ['590'..'599'],
        "NC" => ['270'..'289'],
        "ND" => ['580'..'588'],
        "NE" => ['680'..'693'],
        "NH" => ['030'..'038'],
        "NJ" => ['070'..'089'],
        "NM" => ['870'..'884'],
        "NV" => ['889'..'898'],
        "NY" => ['005','100'..'149'],
        "OH" => ['430'..'459'],
        "OK" => ['730'..'749'],
        "OR" => ['970'..'979'],
        "PA" => ['150'..'196'],
        "PR" => ['006'..'007','009'],
        "RI" => ['028'..'029'],
        "SC" => ['290'..'299'],
        "SD" => ['570'..'577'],
        "TN" => ['370'..'385'],
        "TX" => ['750'..'799','885'],
        "UT" => ['840'..'847'],
        "VA" => ['201','220'..'246'],
        "VI" => ['008'],
        "VT" => ['050'..'054','056'..'059'],
        "WA" => ['980'..'994'],
        "WI" => ['530'..'532','534','535','537'..'542','544'..'549'],
        "WV" => ['247'..'268'],
        "WY" => ['820'..'831']
      }
      
  
  def self.zip_to_state(zip_code)
    self.mapper[self.mapper.longest_prefix(zip_code)]
  end
  
protected
  def self.mapper
    @mapper ||= self.build_mapper(MAPPINGS)
  end

  def self.get_mapping_for(zip)
    self.mapper[self.mapper.longest_prefix(zip)]
  end

  def self.build_mapper(local_mappings)
    local_mapper = Containers::Trie.new
    local_mappings.each do |val, prefix|
      prefix.map{|v| v.is_a?(Range) ? Array(v) : v}.flatten.each do |zip_prefix|
        local_mapper.push(zip_prefix, val)
      end
    end
    return local_mapper
  end
end