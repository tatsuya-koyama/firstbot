# Description:
#   分かり屋 - 適度なタイミングで分かってくれる

module.exports = (robot) ->

  # 意見の投げかけっぽい発言に対して分かってあげる
  robot.hear /.*/i, (msg) ->
    words = trimDesinence msg.match[0]
    if shouldAgree words
      msg.send msg.random agreePhrases
      msg.finish()

  # 笑いに便乗する
  robot.hear /.*[wｗ笑]+$/i, (msg) ->
    return if Math.random() > 0.3
    msg.send msg.random lolPhrases

  robot.respond /.*/i, (msg) ->
    msg.reply msg.random dontKnowPhrases


shouldAgree = (words) ->
  # 結構な確率で反応
  return false if Math.random() > 0.7
  return true if words.match /やな$/
  return true if words.match /やなあ$/
  return true if words.match /だな$/
  return true if words.match /だなあ$/
  return true if words.match /かも$/
  return true if words.match /かもな$/
  return true if words.match /ないかな$/
  return true if words.match /思う$/
  return true if words.match /思うわ$/
  return true if words.match /思うね$/
  return true if words.match /思います$/
  return true if words.match /思ってる$/
  return true if words.match /思った$/
  return true if words.match /思ったわ$/
  return true if words.match /すごそう$/
  return true if words.match /凄そう$/

  # ちょっと確率下がる
  return false if Math.random() > 0.8
  return true if words.match /思う/
  return true if words.match /ったわ$/
  return true if words.match /いいね$/
  return true if words.match /いいすね$/
  return true if words.match /イイネ$/
  return true if words.match /ウケる$/
  return true if words.match /やね$/
  return true if words.match /だね$/
  return true if words.match /かもね$/
  return true if words.match /よね$/
  return true if words.match /すごい$/
  return true if words.match /面白い$/
  return true if words.match /おもしろい$/
  return true if words.match /凄い$/
  return true if words.match /からな$/
  return true if words.match /すよね$/
  return true if words.match /スよね$/

  # 分かるフレーズを拾った場合にも適度に便乗
  return false if Math.random() > 0.8
  return true if words in agreePhrases
  false


# 語尾の「。」や「！」を削除
trimDesinence = (str) ->
  str.replace(/[ー〜。、・…!！ぁぇでwｗ]*$/, "")


agreePhrases = [
  "わかる", "わかる", "わかる"
  "それな", "それな", "それな"
  "確かに", "たしかに"
  "違いない"
  "ほんとそれ", "ほんまそれ"
  "ですね", "ですよね"
  "ね"
  "うん"
  "なるほど", "なるぽこ", "なるへそ"
  "お前は俺か"
  "そういうことやな"
  "全面的に同意です"
  "あるな"
  "I totally agree with you."
]

lolPhrases = [
  "w", "w", "w"
  "ww", "ww", "ww"
  "www"
  "ウケる"
]

dontKnowPhrases = [
  "わからん", "わかんない"
  "ごめん"
  "？", "？？", "…？"
  "えっ", "ん？"
  "ちょっと何言ってるかわかんないですね"
  "帰ってもいいですか"
  "無理"
  "やだー…"
  "それはない"
  "何が？"
]
