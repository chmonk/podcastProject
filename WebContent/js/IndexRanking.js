/**
 * 
 */
 
 function popularPodcaster() {
			console.log("PopFunction Start!");

			let pop1 = document.getElementById("pop1");
			let pop2 = document.getElementById("pop2");
			let pop3 = document.getElementById("pop3");
			let pop4 = document.getElementById("pop4");
			let pop5 = document.getElementById("pop5");
			let pop6 = document.getElementById("pop6");
			let pop7 = document.getElementById("pop7");
			let pop8 = document.getElementById("pop8");

			let img1 = document.getElementById("img1");
			let img2 = document.getElementById("img2");
			let img3 = document.getElementById("img3");
			let img4 = document.getElementById("img4");
			let img5 = document.getElementById("img5");
			let img6 = document.getElementById("img6");
			let img7 = document.getElementById("img7");
			let img8 = document.getElementById("img8");

			let title1 = document.getElementById("title1");
			let title2 = document.getElementById("title2");
			let title3 = document.getElementById("title3");
			let title4 = document.getElementById("title4");
			let title5 = document.getElementById("title5");
			let title6 = document.getElementById("title6");
			let title7 = document.getElementById("title7");
			let title8 = document.getElementById("title8");

			let info1 = document.getElementById("info1");
			let info2 = document.getElementById("info2");
			let info3 = document.getElementById("info3");
			let info4 = document.getElementById("info4");
			let info5 = document.getElementById("info5");
			let info6 = document.getElementById("info6");
			let info7 = document.getElementById("info7");
			let info8 = document.getElementById("info8");

			var content = document.getElementById("portfolioOwl");
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "PopularPodcaster", true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					console.log("readyState & status GOOD!");
					var type = xhr.getResponseHeader("Content-Type");
					var podcasters = JSON.parse(xhr.responseText);
					console.log("podcasters:" + podcasters);

					pop1.value = podcasters[0].memberId;
					pop2.value = podcasters[1].memberId;
					pop3.value = podcasters[2].memberId;
					pop4.value = podcasters[3].memberId;
					pop5.value = podcasters[4].memberId;
					pop6.value = podcasters[5].memberId;
					pop7.value = podcasters[6].memberId;

		

					img1.src=podcasters[0].image;
					img2.src=podcasters[1].image;
					img3.src=podcasters[2].image;
					img4.src=podcasters[3].image;
					img5.src=podcasters[4].image;
					img6.src=podcasters[5].image;
					img7.src=podcasters[6].image;

			
					title1.innerHTML = podcasters[0].nickname;
					title2.innerHTML = podcasters[1].nickname;
					title3.innerHTML = podcasters[2].nickname;
					title4.innerHTML = podcasters[3].nickname;
					title5.innerHTML = podcasters[4].nickname;
					title6.innerHTML = podcasters[5].nickname;
					title7.innerHTML = podcasters[6].nickname;

					info1.innerHTML = podcasters[0].info;
					info2.innerHTML = podcasters[1].info;
					info3.innerHTML = podcasters[2].info;
					info4.innerHTML = podcasters[3].info;
					info5.innerHTML = podcasters[4].info;
					info6.innerHTML = podcasters[5].info;
					info7.innerHTML = podcasters[6].info;

			}
		}
	}


		function popularPodcast(){

			let podimg1=document.getElementById("podimg1");
			let podimg2=document.getElementById("podimg2");
			let podimg3=document.getElementById("podimg3");
			let podimg4=document.getElementById("podimg4");
			let podimg5=document.getElementById("podimg5");
			let podimg6=document.getElementById("podimg6");

			let podinfo1=document.getElementById("podinfo1");
			let podinfo2=document.getElementById("podinfo2");
			let podinfo3=document.getElementById("podinfo3");
			let podinfo4=document.getElementById("podinfo4");
			let podinfo5=document.getElementById("podinfo5");
			let podinfo6=document.getElementById("podinfo6");

			let podtitle1=document.getElementById("podtitle1");
			let podtitle2=document.getElementById("podtitle2");
			let podtitle3=document.getElementById("podtitle3");
			let podtitle4=document.getElementById("podtitle4");
			let podtitle5=document.getElementById("podtitle5");
			let podtitle6=document.getElementById("podtitle6");

			let podlike1=document.getElementById("podlike1");
			let podlike2=document.getElementById("podlike2");
			let podlike3=document.getElementById("podlike3");
			let podlike4=document.getElementById("podlike4");
			let podlike5=document.getElementById("podlike5");
			let podlike6=document.getElementById("podlike6");

			let podclick1=document.getElementById("podclick1");
			let podclick2=document.getElementById("podclick2");
			let podclick3=document.getElementById("podclick3");
			let podclick4=document.getElementById("podclick4");
			let podclick5=document.getElementById("podclick5");
			let podclick6=document.getElementById("podclick6");

			let play1=document.getElementById("play1");
			let play2=document.getElementById("play2");
			let play3=document.getElementById("play3");
			let play4=document.getElementById("play4");
			let play5=document.getElementById("play5");
			let play6=document.getElementById("play6");


			let xhr2 = new XMLHttpRequest();
					xhr2.open("GET", "PopularPodcast", true);
					xhr2.setRequestHeader("Content-type",
							"application/x-www-form-urlencoded");
					xhr2.send();
					xhr2.onreadystatechange = function() {
						if (xhr2.readyState === 4 && xhr.status === 200) {
							console.log("readyState & status GOOD!");
							let typo = xhr2.getResponseHeader("Content-Type");
							let podcasts = JSON.parse(xhr2.responseText);
							console.log("podcasts:" + podcasts);

							podimg1.src=podcasts[0].audioimg;
							podinfo1.innerHTML=podcasts[0].podcastInfo;
							podtitle1.innerHTML=podcasts[0].title;
							podlike1.innerHTML=podcasts[0].likesCount;
							podclick1.innerHTML=podcasts[0].clickAmount;
							play1.id=podcasts[0].podcastId;

							podimg2.src=podcasts[1].audioimg;
							podinfo2.innerHTML=podcasts[1].podcastInfo;
							podtitle2.innerHTML=podcasts[1].title;
							podlike2.innerHTML=podcasts[1].likesCount;
							podclick2.innerHTML=podcasts[1].clickAmount;
							play2.id=podcasts[1].podcastId;

							podimg3.src=podcasts[2].audioimg;
							podinfo3.innerHTML=podcasts[2].podcastInfo;
							podtitle3.innerHTML=podcasts[2].title;
							podlike3.innerHTML=podcasts[2].likesCount;
							podclick3.innerHTML=podcasts[2].clickAmount;
							play3.id=podcasts[2].podcastId;

							podimg4.src=podcasts[3].audiomg;
							podinfo4.innerHTML=podcasts[3].podcastInfo;
							podtitle4.innerHTML=podcasts[3].title;
							podlike4.innerHTML=podcasts[3].likesCount;
							podclick4.innerHTML=podcasts[3].clickAmount;
							play4.id=podcasts[3].podcastId;

							podimg5.src=podcasts[4].audioimg;
							podinfo5.innerHTML=podcasts[4].podcastInfo;
							podtitle5.innerHTML=podcasts[4].title;
							podlike5.innerHTML=podcasts[4].likesCount;
							podclick5.innerHTML=podcasts[4].clickAmount;
							play5.id=podcasts[4].podcastId;

							podimg6.src=podcasts[5].audioimg;
							podinfo6.innerHTML=podcasts[5].podcastInfo;
							podtitle6.innerHTML=podcasts[5].title;
							podlike6.innerHTML=podcasts[5].likesCount;
							podclick6.innerHTML=podcasts[5].clickAmount;
							play6.id=podcasts[5].podcastId;
						}
					}
		}