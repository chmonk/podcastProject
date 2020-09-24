var mediaData = [
	{
		author: "Freedom1111 Trail Studio",
		authorUrl: "https://www.youtube.com/channel/UCx6kpgiQkDkN1UnK5GaATGw",
		fileName: "Swing Theory",
		fileUrl:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/Swing_Theory.mp3",
		thumb:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/15367448967_0551dce9c1_q.jpg"
	},
	{
		author: "Huma-Huma",
		authorUrl: "",
		fileName: "It's All Happening",
		fileUrl:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/It_s_All_Happening.mp3",
		thumb:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/34347642316_fe2f354cfd_q.jpg"
	},
	{
		author: "Danny Kean/Doug Maxwell",
		authorUrl: "https://www.youtube.com/channel/UCwhJTv7O8EmDwyvqMBLHcHg",
		fileName: "So Smooth",
		fileUrl:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/So_Smooth.mp3",
		thumb:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/36981460496_80c2c2bce5_q.jpg"
	},
	{
		author: "Silent Partner",
		authorUrl: "",
		fileName: "Sinking Ship",
		fileUrl:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/Sinking_Ship.mp3",
		thumb:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/38552225096_84b69eb7aa_q.jpg"
	},
	{
		author: "Jimmy Fontanez/Doug Maxwell",
		authorUrl: "https://www.youtube.com/channel/UCwhJTv7O8EmDwyvqMBLHcHg",
		fileName: "Trap Unboxing",
		fileUrl:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/Trap_Unboxing.mp3",
		thumb:
			"https://s3-ap-northeast-1.amazonaws.com/dazedbear-assets/custom-audio-player/41451305061_f0bd9717be_q.jpg"
	},
	{
		author: "米津玄師",
		authorUrl: "",
		fileName: "lemon",
		fileUrl:
			"./programTestFile1/lemon.mp3",
		thumb:
			"./programTestFile1/lemon.jpg"

	}
];

// 格式化秒數
const formatTime = (sec) => {
	const fillZero = (num) => (num < 10 ? `0${num}` : num);

	// FIXME:
	const hour = Math.floor(sec / 3600);
	const minute = Math.floor((sec % 3600) / 60);
	const secs = Math.floor(sec - 3600 * hour - 60 * minute);
	return hour > 0
		? `${fillZero(hour)}:${fillZero(minute)}:${fillZero(secs)}`
		: `${fillZero(minute)}:${fillZero(secs)}`;
};

/**
 * 播放器功能
 */
class AudioPlayer {
	constructor(playlist) {
		this.audioPlayer = new Audio();

		this.playList = playlist || [];
		this.playMode = "step";
		this.currentIdx = 0;
		this.isPlaying = false;
		// internal: volume
		// internal: duration
		// internal: currentTime

		this.initEvents();
		this.setCurrentMusic();
	}

	// 內部註冊的事件
	initEvents() {
		// 建立自訂事件
		this.event = {
			current: new Event("currentmusicchange"),
			playMode: new Event("playmodechange"),
			playList: new Event("playlistchange"),
			isPlaying: new Event("playstatuschange")
		};

		// 換歌時讀到歌曲總時間才算完成更換
		// media element durationchange
		this.audioPlayer.addEventListener("durationchange", () => {
			this.audioPlayer.dispatchEvent(this.event.current);
		});

		// 換歌時判斷是否繼續播放
		this.audioPlayer.addEventListener("currentmusicchange", () => {
			this.isPlaying ? this.audioPlayer.play() : this.audioPlayer.pause();
		});

		// 錯誤狀態停止播放
		this.audioPlayer.addEventListener("playing", () => this.setPlayStatus(true));
		this.audioPlayer.addEventListener("waiting", () => this.setPlayStatus(false));
		this.audioPlayer.addEventListener("error", () => this.setPlayStatus(false));
		this.audioPlayer.addEventListener("stalled", () => this.setPlayStatus(false));

		// 自動播下一首
		this.audioPlayer.addEventListener("ended", () => {
			const nextIdx = this.getNextMusicIdx();
			const stopWhenReachPlaylistEnd = this.playMode === "step" && nextIdx === 0;
			this.setCurrentMusic(nextIdx);
			this.setPlayStatus(!stopWhenReachPlaylistEnd);
		});
	}

	// 對外暴露的註冊事件 callback
	// internal event: timeupdate, volumechange, durationchange
	// custom event: playmodechange, currentmusicchange, playlistchange, playstatuschange
	on(event, callback) {
		this.audioPlayer.addEventListener(event, callback);
	}

	// 指定並讀取當下要播放的音樂
	// identifier = prev, next, 0, <integer>
	setCurrentMusic(identifier = this.currentIdx) {
		if (Number.isInteger(identifier)) {
			if (identifier < 0 || identifier >= this.playList.length) return;
			this.currentIdx = identifier;
		} else if (typeof identifier === "string") {
			const newIdx = this.getNextMusicIdx(identifier);
			if (!newIdx) return;
			this.currentIdx = newIdx;
		} else {
			console.error("不合法的 identifier in setCurrentMusic");
			return;
		}

		this.audioPlayer.setAttribute("src", this.getMediaInfo().fileUrl);
		this.audioPlayer.load();
	}

	// 取得指定的歌曲資訊
	getMediaInfo(idx = this.currentIdx) {
		if (!Number.isInteger(idx) || idx < 0 || idx >= this.playList.length)
			return {};
		return this.playList[this.currentIdx];
	}

	// 播放 / 暫停
	togglePlay(nextIsPlaying = !this.isPlaying) {
		if (nextIsPlaying) {
			// 播放
			this.audioPlayer
				.play()
				.then(() => this.setPlayStatus(true))
				.catch((e) => console.error("播放發生錯誤", e));
		} else {
			// 暫停
			this.audioPlayer.pause();
			this.setPlayStatus(false);
		}
	}

	// 調整播放模式
	setPlayMode(mode) {
		const validMode = ["step", "shuffle", "repeat-one", "repeat-all"];
		if (validMode.indexOf(mode) !== -1) {
			this.playMode = mode;
			this.audioPlayer.dispatchEvent(this.event.playMode);
		}
	}

	// 調整播放狀態
	setPlayStatus(val) {
		if (typeof val !== "boolean") return;
		this.isPlaying = val;
		this.audioPlayer.dispatchEvent(this.event.isPlaying);
	}

	// 取得下一首要播放的歌曲
	getNextMusicIdx(operation = this.playMode) {
		let nextIdx = 0;
		switch (operation) {
			case "step":
				// 到播放清單底，結束播放
				if (this.currentIdx + 1 >= this.playList.length) this.audioPlayer.pause();
				nextIdx =
					this.currentIdx + 1 >= this.playList.length ? 0 : this.currentIdx + 1;
				break;

			case "next":
			case "repeat-all":
				nextIdx =
					this.currentIdx + 1 >= this.playList.length ? 0 : this.currentIdx + 1;
				break;

			case "prev":
				nextIdx =
					this.currentIdx - 1 < 0 ? this.playList.length - 1 : this.currentIdx - 1;
				break;

			case "shuffle":
				nextIdx = Math.floor(Math.random() * this.playList.length - 1);
				break;

			case "repeat-one":
				nextIdx = this.currentIdx;
				break;

			default:
				console.log("不合法的操作", operation);
				return;
		}

		return nextIdx;
	}

	// 音量調整 (0 - 100)
	setVolume(vol) {
		if (typeof vol !== "number") return;
		this.audioPlayer.volume = vol / 100;
	}

	// 進度條調整
	setCurrentTime(nextSec) {
		const currentMusic = this.getMediaInfo();
		if (!currentMusic) return;
		if (nextSec > currentMusic.duration) {
			this.audioPlayer.currentTime = 0;
		} else if (nextSec < 0) {
			this.audioPlayer.currentTime = 0;
		} else {
			this.audioPlayer.currentTime = nextSec;
		}
	}

	// 取得當前音量
	getVolume() {
		return this.audioPlayer.volume;
	}

	// 取得當前秒數
	getCurrentTime() {
		return this.audioPlayer.currentTime;
	}

	// 取得當前歌曲總長度
	getDuration() {
		return this.audioPlayer.duration;
	}

	// 取得當前播放模式
	getPlayMode() {
		return this.playMode;
	}

	// 取得當前播放狀態
	getIsPlaying() {
		return this.isPlaying;
	}
}

/**
 * UI 互動
 */
$(document).ready(() => {
	// DOM elements
	const playBtn = $("#play"); // play_arrow, pause
	const prevBtn = $("#prev");
	const nextBtn = $("#next");
	const shuffleBtn = $("#shuffle");
	const repeatBtn = $("#repeat"); // repeat, repeat_one
	const volumeBtn = $("#volume");
	const volumeWrapper = $("#volume-wrapper");
	const queueBtn = $("#queue");
	const queueCloseBtn = $("#queue-close");
	const queueWrapper = $("#queue-wrapper");
	const timelineBg = $("#timeline-bg");
	const timelineBar = $("#timeline-bar");
	const timelineHandle = $("#timeline-handle");
	const passtime = $("#passtime");
	const duration = $("#duration");
	const volumeBg = $("#volume_bg");
	const volumeBar = $("#volume_bar");
	const volumeHandle = $("#volume_handle");
	const audiotext = $(".playlist-number");;



	//載入頁面時 取得使用者看過的瀏覽列表置換成mediatext
	const getNewMediaData = function(userId) {



		//請求瀏覽紀錄塞入播放清單
		let xhr5 = new XMLHttpRequest();

		xhr5.open("post", "/SpringWebProject/getPlaylist", true);

		xhr5.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

		xhr5.send("userId=" + userId);
		xhr5.onreadystatechange = function() {

			if (xhr5.readyState == 4) {

				if (xhr5.status == 200) {

					var type = xhr5.getResponseHeader("Content-Type");

					if (type.indexOf("application/json") === 0) {

						//clean old mediaData

						//黑魔法清空array
						mediaData.length = 0;


						med = JSON.parse(xhr5.responseText);

						//將object 轉為 js array 才能取用 array方法
						Object.keys(med).map(function(_) { return med[_]; });
						//console.log(med);

						//依序塞入歌曲  舊到新push   反敘為unshift
						med.forEach(function(song, index) {
							mediaData.unshift(song);
						})

						renderPlaylist(mediaData);
					}

				} else {
					console.log("status isn't 200");
				}
			} else {
				console.log("readystate=" + xhr5.readyState);
			}
		};
	};

	//getNewMediaData(1);


	// 歌曲資訊元件
	const MusicInfo = (info, idx) => {
		return `
			<div class="info">
				<img class="info__thumb" src="${info.thumb}"/>
				<div class="info__wrapper">
					<p class="info__author" title="${info.author || "Author"}">${
			info.author || "Author"
			}</p>
					<span class="info__name">${info.fileName || "Song Name"}</span>
				</div>
			</div>
		`;
	};

	// 播放清單
	const renderPlaylist = (playlist) => {
		$("#playlist").html(
			mediaData.map(
				(musicInfo, idx) =>
					`<div id="queue-item-${idx}" class="queue__item">${MusicInfo(
						musicInfo
					)}</div>`
			)
		);

		$("#playlist .queue__item").click(function() {
			const idx = parseInt($(this).attr("id").replace("queue-item-", ""));
			//設定準備播放歌曲
			myAudio.setCurrentMusic(idx);
			//自動播放	
			myAudio.setPlayStatus(true);
		});
	};





	// 當前播放歌曲資訊
	const renderCurrent = (info, currentTime, duration) => {
		$("#current-thumb").attr("src", info.thumb);
		$("#current-author").attr("href", info.authorUrl || "#");
		$("#current-author").html(info.author || "Author");
		$("#current-name").html(info.fileName || "Song Name");
		$("#passtime").html(formatTime(currentTime));
		$("#duration").html(formatTime(duration));
	};

	var myAudio = new AudioPlayer(mediaData);
	const timelineBarTotalLength = 250;
	const volumeBarTotalLength = 100;


	//播放清單取得歌曲
	//以ajax取得控制器傳來的json物件，將其以push的方式加到Array下
	audiotext.click(function() {
		console.log(this);
		var pid = {};
		pid.id = this.id;
		// console.log(this.id);

		xhr = $.ajax({
			url: "/SpringWebProject/addListController",
			//上線應修正成async
			async: true,
			// data:{pid:$("#playNowBtn").val()}
			data: pid,
			dataType: "json",
			success: function(data) {
				// console.log(xhr);
//				console.log(data);
//				mediaData.push(data);//不能用responseText會無法顯示
//				var result = [...new Set(mediaData.map(item => JSON.stringify(item)))].map(item => JSON.parse(item));
//				mediaData = result;
//
//				renderPlaylist();//重新取得清單資訊

                var new_song = data;

				var duplicate = false;
				var duplicate_index;

				for (let i = 0; i < mediaData.length; i++) {
					if (mediaData[i].podcastId == new_song.podcastId) {
						duplicate = true;
						duplicate_index = i;
						break;
					}
				}
				if (duplicate) {
					mediaData.splice(duplicate_index, 1);
					mediaData.push(new_song);
					renderPlaylist(mediaData);
				} else {
					mediaData.push(new_song);
					renderPlaylist(mediaData);
				}

				//設定準備播放歌曲
				myAudio.setCurrentMusic(mediaData.length-1);
				//自動播放	
				myAudio.setPlayStatus(true);





			}

		})





	});

	// 監聽事件顯示 UI
	myAudio.on("playstatuschange", () =>
		//改變播放圖案
		playBtn.html(myAudio.getIsPlaying() ? "pause" : "play_arrow")
	);

	myAudio.on("playmodechange", () => {
		switch (myAudio.playMode) {
			case "step": {
				shuffleBtn.removeClass("select");
				repeatBtn.removeClass("select");
				repeatBtn.html("repeat");
				break;
			}
			case "shuffle": {
				shuffleBtn.addClass("select");
				repeatBtn.removeClass("select");
				repeatBtn.html("repeat");
				break;
			}
			case "repeat-one": {
				shuffleBtn.removeClass("select");
				repeatBtn.addClass("select");
				repeatBtn.html("repeat_one");
				break;
			}
			case "repeat-all": {
				shuffleBtn.removeClass("select");
				repeatBtn.addClass("select");
				repeatBtn.html("repeat");
				break;
			}
			default:
				return;
		}
	});
	myAudio.on("currentmusicchange", () => {
		const currentTime = myAudio.getCurrentTime();
		const duration = myAudio.getDuration();
		renderCurrent(
			myAudio.getMediaInfo(),
			myAudio.getCurrentTime(),
			myAudio.getDuration()
		);
		passtime.html(formatTime(currentTime));
		timelineBar.width(`${(currentTime / duration) * timelineBarTotalLength}px`);
		timelineHandle.css(
			"left",
			`${(currentTime / duration) * timelineBarTotalLength}px`
		);
	});
	myAudio.on("timeupdate", () => {
		const currentTime = myAudio.getCurrentTime();
		const duration = myAudio.getDuration();
		passtime.html(formatTime(currentTime));
		timelineBar.width(`${(currentTime / duration) * timelineBarTotalLength}px`);
		timelineHandle.css(
			"left",
			`${(currentTime / duration) * timelineBarTotalLength}px`
		);
	});
	myAudio.on("volumechange", () =>
		volumeBar.height(`${myAudio.getVolume() * volumeBarTotalLength}px`)
	);

	// 播放 or 停止
	playBtn.click(() => myAudio.togglePlay());

	// 上一首歌 or 下一首歌
	prevBtn.click(() => myAudio.setCurrentMusic(myAudio.getNextMusicIdx("prev")));
	nextBtn.click(() => myAudio.setCurrentMusic(myAudio.getNextMusicIdx("next")));

	// shuffle 播放開關
	shuffleBtn.click(() =>
		myAudio.setPlayMode(myAudio.getPlayMode() === "shuffle" ? "step" : "shuffle")
	);

	// repeat 播放開關
	repeatBtn.click(() => {
		const playMode = myAudio.getPlayMode();
		if (playMode === "repeat-one") {
			myAudio.setPlayMode("step");
		} else if (playMode === "repeat-all") {
			myAudio.setPlayMode("repeat-one");
		} else {
			myAudio.setPlayMode("repeat-all");
		}
	});

	// 播放清單開關
	queueBtn.click(() => {
		queueWrapper.removeClass("hidden");
		//queueWrapper.toggleClass("hidden");
		queueBtn.toggleClass("select");
	});

	queueCloseBtn.click(() => {
		queueWrapper.addClass("hidden");
		queueBtn.removeClass("select");
	});
	//離開播放選單元素時關閉播放選單
	queueWrapper.on("mouseleave", () => {
		queueWrapper.addClass("hidden");
	})


	// 音量調整面板
	//按下音量紐開關音量調節面板
	volumeBtn.on("click", () => volumeWrapper.toggleClass("hidden"));

	volumeWrapper.on("mouseleave", () => volumeWrapper.addClass("hidden"));

	// 拖動時間軸
	timelineHandle.draggable({
		axis: "x",
		containment: timelineBg,
		start: (event, ui) => myAudio.togglePlay(false),
		drag: (event, ui) => {
			const nextSec = Math.floor(
				ui.position.left * (myAudio.getDuration() / timelineBarTotalLength)
			);
			passtime.html(formatTime(nextSec));
			timelineBar.width(`${ui.position.left}px`);
		},
		stop: (event, ui) => {
			const nextSec = Math.floor(
				ui.position.left * (myAudio.getDuration() / timelineBarTotalLength)
			);
			myAudio.setCurrentTime(nextSec);
			myAudio.togglePlay(true);
		}
	});

	// 調整音量
	volumeHandle.draggable({
		axis: "y",
		containment: volumeBg,
		drag: (event, ui) => {
			const vol = volumeBarTotalLength - ui.position.top;
			volumeBar.height(`${vol}px`);
			myAudio.setVolume(vol);
		}
	});


	//取得使用者id  渲染成對應的播放清單
	//getNewMediaData(1);


	/////////////////////////////////
	//	var lemon = $("#lemon");
	//
	//	lemon.click("on", function() {
	//
	//		let xhr = new XMLHttpRequest();
	//
	//		xhr.open("get", "/SpringWebProject/postjson", true);
	//
	//		xhr.send();
	//
	//		xhr.onreadystatechange = function() {
	//			if (xhr.status == 200 && xhr.readyState == 4) {
	//				alert(xhr.responseText);
	//
	//				mediaData.push(JSON.parse(xhr.responseText));
	//
	//				renderPlaylist(mediaData);
	//
	//			}
	//		}
	//	})

	//生成對應memberid所含圖片列表(未來替換成播放條列表)
	$("button.t")
		.on("click", function(e) {

			//測試取得按鈕上memberid
			//console.log(e.target.id);

			//發送要求由 memberid取得 所含有的列表
			let xhr1 = new XMLHttpRequest();

			xhr1.open("get",
				"/SpringWebProject/gettheplayersong?name="
				+ e.target.id, true);

			//傳輸語句測試
			console.log("/SpringWebProject/gettheplayersong?name=" + e.target.id);
			//SpringWebProject/gettheplayersong?name=17


			//收到資料後新建成帶有program id的圖片
			xhr1.onreadystatechange = function() {
				if (xhr1.status == 200 && xhr1.readyState == 4) {

					console.log(xhr1.readyState);
					alert(xhr1.responseText);

					//<img id="lemon" src="programimg/17_307_img.jpg">

					let gettheplayerresult = JSON
						.parse(xhr1.responseText);

					document.getElementById("show").innerHTML = "";

					for (let i = 0; i < gettheplayerresult.length; i++) {

						//<img id="lemon" src="programimg/17_307_img.jpg">

						let content = "<img id='" + gettheplayerresult[i]["podcastId"] + "' src='" + gettheplayerresult[i]["audioimg"] + "'>";


						//資料家道div show的最後元素
						document.getElementById("show")
							.insertAdjacentHTML(
								'beforeend', content);
					}

				}
			}
			xhr1.send();
		})



	//點選#show下的圖片觸發新增到播放列表 同時發送使用者id(利用html input tag) 節目id(綁在節目圖示)
	$("#show").on("click", "img", function() {

		//取得this的id  this.id , this 指向對應element
		//console.log(this.id);
		var thisid = this.id;


		//取得使樂者id
		var userid = document.getElementById("userid").dataset.value;

		//測試字串
		console.log("/SpringWebProject/postjson/" + userid + "/?id=" + thisid);

		let xhr = new XMLHttpRequest();
		console.log(this);
		xhr.open("get", "/SpringWebProject/postjson/" + userid + "/?id=" + thisid, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.status == 200 && xhr.readyState == 4) {
				alert(xhr.responseText);


				var new_song = JSON.parse(xhr.responseText);

				var duplicate = false;
				var duplicate_index;

				for (let i = 0; i < mediaData.length; i++) {
					if (mediaData[i].podcastId == new_song.podcastId) {
						duplicate = true;
						duplicate_index = i;
						break;
					}
				}
				if (duplicate) {
					mediaData.splice(duplicate_index, 1);
					mediaData.unshift(new_song);
					renderPlaylist(mediaData);
				} else {
					mediaData.unshift(new_song);
					renderPlaylist(mediaData);
				}

				//設定準備播放歌曲
				myAudio.setCurrentMusic(0);
				//自動播放	
				myAudio.setPlayStatus(true);
			}
		}

	})


	console.log(mediaData);
	renderPlaylist(mediaData);
});
