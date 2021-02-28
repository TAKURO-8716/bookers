{"changed":true,"filter":false,"title":"image_uploader.rb","tooltip":"/bookers/app/uploaders/image_uploader.rb","value":"require \"image_processing/mini_magick\"\n\nclass ImageUploader < Shrine\n  plugin :processing # allows hooking into promoting\n  plugin :versions   # enable Shrine to handle a hash of files\n  plugin :delete_raw # delete processed files after uploading\n\n  process(:store) do |io, context|\n    versions = { original: io } # retain original\n\n    io.download do |original|\n      pipeline = ImageProcessing::MiniMagick.source(original)\n\n      versions[:large]  = pipeline.resize_to_limit!(800, 800)\n      versions[:medium] = pipeline.resize_to_limit!(500, 500)\n      versions[:small]  = pipeline.resize_to_limit!(300, 300)\n    end\n\n    versions # return the hash of processed files\n  end\n  \n  Attacher.validate do\n    validate_max_size 5 * 1024 * 1024, message: '5MBを超える画像はアップロードできません。'\n    validate_mime_type_inclusion %w(image/jpeg image/png)\n  end\nend","undoManager":{"mark":3,"position":5,"stack":[[{"start":{"row":0,"column":0},"end":{"row":1,"column":3},"action":"insert","lines":["class ImageUploader < Shrine","end"],"id":1}],[{"start":{"row":0,"column":28},"end":{"row":1,"column":0},"action":"insert","lines":["",""],"id":2},{"start":{"row":1,"column":0},"end":{"row":1,"column":4},"action":"insert","lines":["    "]}],[{"start":{"row":0,"column":0},"end":{"row":2,"column":3},"action":"remove","lines":["class ImageUploader < Shrine","    ","end"],"id":3}],[{"start":{"row":0,"column":0},"end":{"row":20,"column":3},"action":"insert","lines":["require \"image_processing/mini_magick\"","","class ImageUploader < Shrine","  plugin :processing # allows hooking into promoting","  plugin :versions   # enable Shrine to handle a hash of files","  plugin :delete_raw # delete processed files after uploading","","  process(:store) do |io, context|","    versions = { original: io } # retain original","","    io.download do |original|","      pipeline = ImageProcessing::MiniMagick.source(original)","","      versions[:large]  = pipeline.resize_to_limit!(800, 800)","      versions[:medium] = pipeline.resize_to_limit!(500, 500)","      versions[:small]  = pipeline.resize_to_limit!(300, 300)","    end","","    versions # return the hash of processed files","  end","end"],"id":4}],[{"start":{"row":19,"column":5},"end":{"row":20,"column":0},"action":"insert","lines":["",""],"id":5},{"start":{"row":20,"column":0},"end":{"row":20,"column":2},"action":"insert","lines":["  "]},{"start":{"row":20,"column":2},"end":{"row":21,"column":0},"action":"insert","lines":["",""]},{"start":{"row":21,"column":0},"end":{"row":21,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":21,"column":2},"end":{"row":24,"column":5},"action":"insert","lines":["Attacher.validate do","    validate_max_size 5 * 1024 * 1024, message: '5MBを超える画像はアップロードできません。'","    validate_mime_type_inclusion %w(image/jpeg image/png)","  end"],"id":6}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":24,"column":5},"end":{"row":24,"column":5},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1614073171118}