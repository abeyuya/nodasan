#!/usr/bin/env ruby

require "pp"

# 入力データ取得
data = gets.chomp.split(" ")
item_prise_count = data[0].to_i
mix_prise_count  = data[1].to_i

item_prise_list = Array.new
mix_prise_list  = Array.new

item_prise_count.times {
  item_prise_list.push(gets.to_i)
}
mix_prise_count.times {
  mix_prise_list.push(gets.to_i)
}

# 計算
answer_list = Array.new
mix_prise_list.each do |target_prise|
  answer_prise  = 0
  tmp_mix_prise = 0

  item_prise_list.each_with_index do |item_1_prise, i|
    item_prise_list.each_with_index do |item_2_prise, j|
      next if i == j
      tmp_mix_prise = item_1_prise + item_2_prise

      if tmp_mix_prise > answer_prise
        if tmp_mix_prise <= target_prise
          answer_prise = tmp_mix_prise
          tmp_mix_prise = 0
        end
      end
    end
  end

  answer_list.push(answer_prise)
end

# 出力
answer_list.each do |answer|
  p answer
end
