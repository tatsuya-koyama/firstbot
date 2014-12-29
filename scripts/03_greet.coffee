# Description:
#   挨拶に便乗する

module.exports = (robot) ->

  # 挨拶に便乗する
  robot.hear /.*/, (msg) ->
    return if Math.random() > 0.7

    words = trimDesinence msg.match[0]
    return if words.length is 0

    for greetings in greetTypes
      for greet in greetings
        if words.indexOf(greet) isnt -1
          msg.send msg.random greetings
          return


# 語尾の「。」や「！」を削除
trimDesinence = (str) ->
  str.replace(/[ー〜。、・…!！ぁぇでwｗ]*$/, "")


greetTypes = [
  ["おはよう", "お早う"]
  ["おつかれ", "おつかれさま", "お疲れ", "おつです"]
  ["ごめん", "ごめんなさい", "すまん", "すみません", "申し訳ない"]
  ["ありがとう", "サンクス"]
]
