#!./scripts/create_video_real_A_fake_B.sh
ffmpeg -i ./results/$1/test_latest/images/%05d_real_A.png -framerate 5 ./results/$1/real_A.mp4
ffmpeg -i ./results/$1/test_latest/images/%05d_fake_B.png -framerate 5 ./results/$1/fake_B.mp4
ffmpeg -i ./results/$1/real_A.mp4 -i ./results/$1/fake_B.mp4 -filter_complex '[0:v]pad=iw*2:ih[int];[int][1:v]overlay=W/2:0[vid]' -map [vid] ./results/$1/real_A_fake_B.mp4

