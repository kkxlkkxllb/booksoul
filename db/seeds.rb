# coding: utf-8 
def generate(path,title,author,info,keyword_list)
  @book = Book.create(:title => title,:author => author,:info => info,:keyword_list => keyword_list)
  lines = File.readlines(path)    
  all_text = lines.join
  i = 0
  words_per_page = 2000
  page = []
  while i < all_text.size/words_per_page
    page[i] = all_text[i*words_per_page..(i+1)*words_per_page-1]
    sentence = page[i].split(/\n/)
    if i == 0
      sentence_start = sentence_end = ''
    else
      sentence_start = sentence_end
    end
    sentence_end = sentence[sentence.size-1]  
    content = sentence_start + page[i].sub(sentence_end,'')
    BookPage.create(:content => content,:book_id => @book.id,:num => i+1)     
    i = i + 1   
  end
  the_last = i*words_per_page
  page[i] = all_text[the_last..all_text.size]
  content = sentence_end + page[i]
  BookPage.create(:content => content,:book_id => @book.id,:num => i+1)
end
generate('./public/books/twocold.txt',"1988,我想和这个世界谈谈","韩寒",
      "小说从书名到内容充满了暗示和影射。譬如书名《1988》，这是一个敏感的时间点，因为第二年也就是小说中丁丁哥哥死去的那一年，中国发生了一件至今不能公开讨论的事件；所以1989至今仍是许多“勇士们”念念不忘、扼腕叹息的年份，他们觉得这个国家失去了一次选择的机会。而在1988年，丁丁哥哥说要去北方“和这个世界谈谈”。丁丁哥哥到底想跟这个世界谈什么，小说没有交代，或许是丁丁哥哥什么都来不及谈就被和谐了。虽然韩寒在接受采访时对书名闪烁其辞，但看完书后大家都会明白怎么回事。——摘自：潇湘晨曦",
      "小说,韩寒")
generate('./public/books/another.txt',"远方有个女儿国","白桦",
      "我第一次看《远方有个女儿国》，应该是我高三的时候，17岁。我被小说中的两个故事牵引着，一个是苏纳美的女儿国，一个是梁锐的文革，两个离我都无比遥远的故事，但却真实地触动我，改变我，充实我。直到两个故事交汇，我发现我不希望这两个世界间有任何联系，一个纯净坦荡自然。一个却充满人性的丑陋。现在“文明”战胜了“原始”，人的坦荡消失了，人间的矛盾加剧了，到如今我想再回到小说中去体验一次女儿国的世界，我想每个人都该感受一下这个曾经真实存在的世界，作为我心目中最好的小说，我想亲手将她传递给全世界的人去阅读。我眼前已经看到了蓝色小碎花的布窗帘。",
      "小说,文化")
generate('./public/books/jianghu.txt',"白发魔女传","梁羽生",
      "这是我看过的梁羽生作品里印象最深的一部小说，也是第一次认真读武侠小说。梁羽生的小说中诗词很多，大多是梁羽生自己创作的，都很经典。“别后音书两不闻，预知谣诼必纷纭。只缘海内存知己，始信天涯若比邻。历劫了无生死念，经霜方显傲寒心！冬风尽折花千树，尚有幽香放上林。”",
      "武侠,小说")
generate('./public/books/sophie.txt',"苏菲的世界","乔斯坦·贾德","14岁的少女苏菲某天放学回家，发现了神秘的一封信。----你是谁？----世界从哪里来？就这样，在一位神秘导师的指导引下，苏菲开始思索从古希腊到康德，从祁克果到佛洛伊德等各位大师所思考的根本问题。与此同时，苏菲不断接到了些极不寻常的来信，世界像迹团一般在她眼底展开。苏菲运用少女天生的悟性与后天知识，企图解开这些迹团然而事实真相远比她所想的更怪异、更离奇……《苏菲的世界》，即是智慧的世界，梦的世界。它将会唤醒每个人内心深处对生命的赞叹与对人生终极意义的关怀和好奇。",
      "启蒙,哲学")
generate('./public/books/man.txt',"丹尼斯·罗德曼自传","丹尼斯·罗德曼","他是NBA的篮板怪兽，他是底特律活塞的坏孩子，他是公牛王朝的铁三角之一，他和麦当娜有过一腿，他是《灌篮高手》中樱木的原型，他就是我行我素的丹尼斯·罗德曼！不记得是什么时候看的这本自传了，但从此认识了这个霸气的男人，他曾经脆弱到想自杀，但后来铸就强大的内心，他的故事给了我启示和共鸣，深深地致敬！",
      "自传,纪实")