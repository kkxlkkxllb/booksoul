KE.show({
    id : 'rich',
		resizeMode : 1,
    allowFileManager : true,
    imageUploadJson:'/kindeditor/upload',
		height: "400",
		htmlTags: {
								font : [],
				        span : [],
				        div : ['class', 'align', 'style'],
				        table: [],
				        'td,th': [],
				        a : ['class', 'href', 'target', 'name', 'style'],
				        embed : ['src', 'width', 'height', 'type', 'loop', 'autostart', 'quality',
				'style', 'align', 'allowscriptaccess', '/'],
				        img : ['src', 'width', 'height', 'alt', 'title', 'align', 'style', '/'],
				        hr : [],
				        br : ['/'],
				        'p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6' : ['align', 'style'],
				        'tbody,tr,strong,b,sub,sup,em,i,u,strike' : []
			},
			allowPreviewEmoticons : false,
			items : ['source','|', 'fullscreen', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
              'insertunorderedlist', '|', 'flash','emoticons', 'image', 'link','unlink']
});
KE.show({
        id : 'chat',
        resizeMode : 0,
				width: '100%',
				height: '150px',
				filterMode: true,
				htmlTags: {
									font : [],
					        span : [],
					        div : ['class', 'align', 'style'],
					        table: [],
					        'td,th': [],
					        a : ['class', 'href', 'target', 'name', 'style'],
					        embed : ['src', 'width', 'height', 'type', 'loop', 'autostart', 'quality',
					'style', 'align', 'allowscriptaccess', '/'],
					        img : ['src', 'width', 'height', 'alt', 'title', 'align', 'style', '/'],
					        hr : [],
					        br : ['/'],
					        'p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6' : ['align', 'style'],
					        'tbody,tr,strong,b,sub,sup,em,i,u,strike' : []
				},
        allowPreviewEmoticons : false,
        allowUpload : false,
        items : [ 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'flash','emoticons', 'image', 'link','unlink']
      });