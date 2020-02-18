CM_STATUS_NON_INFO = -1
CM_STATUS_PLAYING = 0
CM_STATUS_PAUSE = 1
local function Print(msg,color)
    if GetConVar("cloudmusic_verbose") ~= nil and GetConVar("cloudmusic_verbose"):GetInt() ~= 1 then return end
    local DEF_COLOR = CLIENT and Color( 255, 222, 102 ) or Color( 137, 222, 255 )
    if color == nil then color = DEF_COLOR end
    MsgC(DEF_COLOR,"[",Color(106,204,255),"CloudMusic",DEF_COLOR,"] ",color,msg,"\n")
end
local CLOUDMUSIC_VER = "1.5.0 Beta 20200219" -- DO NOT modify unless you know WHAT ARE YOU DOING
if CLIENT then
    local LANGUAGES = {
        ["zh-CN"] = {
            ["title"] = "网易云音乐",
            ["success"] = "成功",
            ["warning"] = "警告",
            ["error"] = "错误",
            ["ok"] = "好的",
            ["sure"] = "确定",
            ["cancel"] = "算了",
            ["open"] = "打开",
            ["close"] = "关闭",
            ["fetch"] = "获取",
            ["play"] = "播放",
            ["pause"] = "暂停",
            ["volume"] = "音量",
            ["login"] = "登录",
            ["search"] = "搜索",
            ["back"] = "返回",
            ["author"] = "作者",
            ["welcome"] = "欢迎",
            ["profile"] = "个人信息",
            ["logout"] = "注销",
            ["playing"] = "正在播放",
            ["paused"] = "已暂停",
            ["blocked"] = "已屏蔽",
            ["unblocked"] = "未屏蔽",
            ["top_left"] = "左上角",
            ["top_right"] = "右上角",
            ["bottom_left"] = "左下角",
            ["bottom_right"] = "右下角",
            ["login_title"] = "登录网易云音乐账号",
            ["use_phone"] = "使用手机号登录",
            ["use_email"] = "使用邮箱登录",
            ["phone"] = "手机号",
            ["email"] = "电子邮件",
            ["password"] = "密码",
            ["read_agreed"] = "我已阅读并同意",
            ["privacy_policy"] = "《Cloud Music for Garry's Mod隐私政策》",
            ["privacy_policy_warn"] = "使用此功能你需要阅读并同意《CloudMusic for Garry's Mod隐私政策》",
            ["loginfailed"] = "登陆失败",
            ["loginsuccess"] = "登录成功！欢迎回来，%name%",
            ["logoutsuccess"] = "注销成功",
            ["logoutfailed"] = "注销失败",
            ["greeting"] = "你好，%name%",
            ["wait"] = "请稍等...",
            ["user_details"] = "你订阅了%djRadioCount%个电台\n收藏了%mvCount%个MV\n关注了%artistCount%个歌手\n创建了%createDjRadioCount%个电台\n创建了%createdPlaylistCount%个歌单\n收藏了%subPlaylistCount%个歌单",
            ["signin"] = "签到",
            ["signinsuccess"] = "签到成功\n获得%point%点数",
            ["signinfailed"] = "签到失败",
            ["fetch_failed"] = "获取失败",
            ["settings"] = "设置",
            ["playlist_id"] = "歌单ID",
            ["wrong_playlist_id"] = "请输入正确的歌单ID",
            ["fetch_playlist_failed"] = "获取歌单失败",
            ["search_song"] = "搜索歌曲",
            ["search_failed"] = "搜索失败",
            ["searchresult"] = "搜索到 %count% 首歌曲",
            ["daily_recommend"] = "每日推荐",
            ["fetch_daily_recommend_failed"] = "无法获取每日推荐",
            ["my_playlists"] = "我的歌单",
            ["fetch_user_playlists_failed"] = "无法获取用户歌单",
            ["prev_page"] = "上一页",
            ["next_page"] = "下一页",
            ["switch_page_failed"] = "换页失败",
            ["song_name"] = "歌曲名",
            ["artist"] = "歌手",
            ["album"] = "专辑",
            ["song_id"] = "歌曲ID",
            ["empty_playlist_msg"] = "歌单为空",
            ["empty_playlist"] = "空歌单",
            ["next_play"] = "下一首播放",
            ["add_to_playlist"] = "添加到播放列表",
            ["copy_songid"] = "复制歌曲ID",
            ["copy_songurl"] = "复制歌曲URL",
            ["add_selected_to_playlist"] = "将选中歌曲添加到播放列表",
            ["add_list_to_playlist"] = "将列表中歌曲全部添加到播放列表",
            ["clear_list"] = "清空此列表",
            ["undo_warn"] = "此操作无法撤销，你确定吗？",
            ["sure_warn"] = "你确定要这样做吗？",
            ["clear_song_list_title"] = "清空歌曲列表",
            ["playlist_name"] = "歌单名",
            ["song_count"] = "歌曲数",
            ["playlist_id"] = "歌单ID",
            ["playlistfailed"] = "获取歌单失败",
            ["add_playlist_to_playlist"] = "将歌单中歌曲全部添加到播放列表",
            ["copy_playlist_id"] = "复制歌单ID",
            ["clear_songlist_title"] = "清空歌单列表",
            ["remove_selected_songs"] = "删除选中歌曲",
            ["clear_playlist_title"] = "清空播放列表",
            ["trying_play"] = "正在尝试播放...",
            ["buffering"] = "正在缓冲...",
            ["prev_song"] = "上一首",
            ["next_song"] = "下一首",
            ["list_loop"] = "列表循环",
            ["single_loop"] = "单曲循环",
            ["random_play"] = "随机播放",
            ["list_play"] = "列表播放",
            ["copy_link"] = "复制链接",
            ["disable_volume_enhance"] = "关闭音量增强",
            ["enable_volume_enhance"] = "开启音量增强",
            ["display_ui_fft"] = "显示界面内频谱",
            ["display_hud_fft"] = "显示HUD频谱",
            ["hud_fft_warn"] = "（部分情况可能会导致严重掉帧）",
            ["display_lyric"] = "显示歌词",
            ["enable_animation"] = "启用动画",
            ["enable_3dplay"] = "打开3D外放",
            ["bypass_3dplay"] = "屏蔽他人3D外放",
            ["center_lyric"] = "歌词置于游戏界面底部中央",
            ["hud_pos"] = "HUD位置",
            ["use_server_link"] = "使用服务器获取链接（VIP歌曲相关）",
            ["use_server_link_tip"] = "听VIP歌曲需勾选并登录网易云VIP账号",
            ["hud_text_shadow"] = "HUD文字阴影",
            ["ui_color"] = "界面颜色",
            ["player_list"] = "玩家列表",
            ["custom_css"] = "自定义HUD CSS",
            ["description"] = "本播放器由Texas制作，歌词功能使用了Cloudflare Worker进行简化处理",
            ["advice"] = "建议游戏分辨率设为1366x768或以上",
            ["lyric_size"] = "歌词大小",
            ["player_name"] = "玩家名字",
            ["blacklist"] = "黑名单",
            ["add_remove_blacklist"] = "加入/移出黑名单",
            ["copy_player_name"] = "复制玩家名称",
            ["copy_steamid"] = "复制Steam64ID",
            ["remove_all_blacklist"] = "将所有黑名单玩家移出",
            ["clear_blacklist_title"] = "清空黑名单",
            ["add_all_players_to_blacklist"] = "将所有玩家移入黑名单",
            ["all_blacklist_title"] = "将所有玩家移入黑名单",
            ["reset_all_colors"] = "重置所有颜色",
            ["reset_all_colors_title"] = "重置所有颜色",
            ["text_color"] = "文字颜色",
            ["background_color"] = "背景颜色",
            ["title_text_color"] = "标题栏文字颜色",
            ["title_color"] = "标题栏颜色",
            ["button_color"] = "按钮颜色",
            ["button_hover_color"] = "按钮悬浮颜色",
            ["button_activate_color"] = "按钮激活颜色",
            ["button_text_color"] = "按钮文字颜色",
            ["input_text_color"] = "输入框文字颜色",
            ["player_fft_color"] = "播放器内频谱颜色",
            ["progress_bar_color"] = "进度条颜色",
            ["hud_text_color"] = "HUD文字颜色",
            ["hud_played_progress_bar_color"] = "HUD已播放进度条颜色",
            ["hud_unplayed_progress_bar_color"] = "HUD未播放进度条颜色",
            ["hud_fft_color"] = "HUD频谱颜色",
            ["contact"] = "联系Texas",
            ["donate"] = "赞助作者",
            ["no_info"] = "暂无信息，对方可能未播放音乐或未开放信息",
            ["lyricfailed"] = "无法获取 %name% 的歌词",
            ["lyricfailed_detail"] = "无法获取 %name% 的歌词（%msg%）",
            ["nolyric"] = "歌曲 %name% 暂无歌词",
            ["playerror"] = "无法播放 %name%",
            ["continue_error"] = "由于已经连续5次无法播放，将停止尝试",
            ["playerror_loop"] = "由于 %name% 无法播放，已切到下一首",
            ["userinfofailed"] = "获取网易云用户信息失败",
            ["try_play"] = "正在尝试播放",
            ["empty_playlist"] = "播放列表为空",
            ["3dplay_no_perm"] = "你没有权限开启外放",
            ["no_perm"] = "无权限",
            ["clipboard_msg"] = "已复制到剪贴板",
            ["clipboard_title"] = "复制成功",
            ["outdated"] = "（旧版本，不受支持）",
            ["modified"] = "（修改版，不受支持）",
            ["cm_usable"] = "尝试使用Cloud Music",
            ["instruction"] = "你可以在聊天框输入!cm或!cloudmusic打开网易云音乐播放器\n或者按下Alt+↓使用快捷键打开",
            ["verbose_help"] = "启用网易云播放器啰嗦模式"
        },
        ["zh-TW"] = {
            ["title"] = "網易雲音樂",
            ["success"] = "成功",
            ["warning"] = "警告",
            ["error"] = "錯誤",
            ["ok"] = "好的",
            ["sure"] = "確定",
            ["cancel"] = "放棄",
            ["open"] = "打開",
            ["close"] = "關閉",
            ["fetch"] = "取得",
            ["play"] = "播放",
            ["pause"] = "暫停",
            ["volume"] = "音量",
            ["login"] = "登錄",
            ["search"] = "搜尋",
            ["back"] = "返回",
            ["author"] = "作者",
            ["welcome"] = "歡迎",
            ["profile"] = "個人資料",
            ["logout"] = "登出",
            ["blocked"] = "已封鎖",
            ["unblocked"] = "未封鎖",
            ["top_left"] = "左上角",
            ["top_right"] = "右上角",
            ["bottom_left"] = "左下角",
            ["bottom_right"] = "右下角",
            ["login_title"] = "登錄網易雲音樂帳號",
            ["use_phone"] = "使用手機號碼登錄",
            ["use_email"] = "使用Email登陸",
            ["phone"] = "手機號碼",
            ["email"] = "Email",
            ["password"] = "密碼",
            ["read_agreed"] = "我已詳讀並同意",
            ["privacy_policy"] = "《Cloud Music for Garry's Mod隱私政策》",
            ["privacy_policy_warn"] = "使用此功能您必須閱讀並同意《CloudMusic for Garry's Mod隱私政策》",
            ["loginfailed"] = "登錄失敗",
            ["loginsuccess"] = "登錄成功！歡迎回來，%name%",
            ["logoutsuccess"] = "註銷成功",
            ["logoutfailed"] = "註銷失敗",
            ["greeting"] = "您好，%name%",
            ["wait"] = "請稍候...",
            ["user_details"] = "您訂閱了%djRadioCount%個頻道\n收藏了%mvCount%个MV\n關注了%artistCount%個藝術家\n建立了%createDjRadioCount%個頻道\n建立了%createdPlaylistCount%個播放清單\n收藏了%subPlaylistCount%個播放清單",
            ["signin"] = "簽到",
            ["signinsuccess"] = "簽到成功\n得到%point%點數",
            ["signinfailed"] = "簽到失敗",
            ["fetch_failed"] = "取得失败",
            ["settings"] = "設定",
            ["playlist_id"] = "播放清單ID",
            ["wrong_playlist_id"] = "請輸入正確的播放清單ID",
            ["fetch_playlist_failed"] = "取得播放清單失敗",
            ["search_song"] = "搜尋歌曲",
            ["search_failed"] = "搜尋失敗",
            ["searchresult"] = "搜尋到 %count% 首歌曲",
            ["daily_recommend"] = "每日推薦",
            ["fetch_daily_recommend_failed"] = "無法取得每日推薦",
            ["my_playlists"] = "我的播放清單",
            ["fetch_user_playlists_failed"] = "無法取得會員播放清單",
            ["prev_page"] = "上一頁",
            ["next_page"] = "下一頁",
            ["switch_page_failed"] = "換頁失敗",
            ["song_name"] = "曲名",
            ["artist"] = "藝術家",
            ["album"] = "專輯",
            ["song_id"] = "音樂ID",
            ["empty_playlist_msg"] = "播放清單空白",
            ["empty_playlist"] = "空白播放清單",
            ["next_play"] = "下一首播放",
            ["add_to_playlist"] = "新增至播放清單",
            ["copy_songid"] = "複製音樂ID",
            ["copy_songurl"] = "複製音樂URL",
            ["add_selected_to_playlist"] = "將選取項目新增至播放清單",
            ["add_list_to_playlist"] = "將清單所有項目新增至播放清單",
            ["clear_list"] = "清空清單",
            ["undo_warn"] = "動作無法復原，您確定嗎？",
            ["sure_warn"] = "確定執行？",
            ["clear_song_list_title"] = "清空曲目清單",
            ["playlist_name"] = "播放清單名稱",
            ["song_count"] = "曲目數量",
            ["playlist_id"] = "播放清單ID",
            ["playlistfailed"] = "取得播放清單失敗",
            ["add_playlist_to_playlist"] = "將播放清單所有項目新增至播放清單",
            ["copy_playlist_id"] = "複製播放清單ID",
            ["clear_songlist_title"] = "清空曲目列表",
            ["remove_selected_songs"] = "刪除選取項目",
            ["clear_playlist_title"] = "清空播放清單",
            ["trying_play"] = "正在嘗試播放...",
            ["buffering"] = "正在緩衝...",
            ["prev_song"] = "上一首",
            ["next_song"] = "下一首",
            ["list_loop"] = "清單循環",
            ["single_loop"] = "單曲循環",
            ["random_play"] = "隨機播放",
            ["list_play"] = "播放清單",
            ["copy_link"] = "複製鏈結",
            ["disable_volume_enhance"] = "關閉音量增強",
            ["enable_volume_enhance"] = "開啟音量增強",
            ["display_ui_fft"] = "於視窗顯示動畫",
            ["display_hud_fft"] = "HUD顯示動畫",
            ["hud_fft_warn"] = "（可能導致效能降低）",
            ["display_lyric"] = "顯示歌詞",
            ["enable_animation"] = "啟用視窗動畫",
            ["enable_3dplay"] = "啟用3D外放",
            ["bypass_3dplay"] = "遮蔽他人3D外放",
            ["center_lyric"] = "歌詞置中",
            ["hud_pos"] = "HUD位置",
            ["use_server_link"] = "使用伺服器取得鏈結（VIP歌曲相關）",
            ["use_server_link_tip"] = "聽VIP曲目需勾選並登錄網易雲VIP帳號",
            ["hud_text_shadow"] = "HUD文字陰影",
            ["ui_color"] = "視窗顏色",
            ["player_list"] = "玩家列表",
            ["custom_css"] = "自訂HUD CSS",
            ["description"] = "本播放器Texas製作，歌詞功能使用了Cloudflare Worker進行簡化處理，由TLExpress翻譯",
            ["advice"] = "建議將遊戲解析度設定為1366x768或以上",
            ["lyric_size"] = "歌詞大小",
            ["player_name"] = "玩家名稱",
            ["blacklist"] = "黑名單",
            ["add_remove_blacklist"] = "新增/移除黑名單",
            ["copy_player_name"] = "複製玩家名稱",
            ["copy_steamid"] = "複製Steam64ID",
            ["remove_all_blacklist"] = "移除所有黑名單玩家",
            ["clear_blacklist_title"] = "清除黑名單",
            ["add_all_players_to_blacklist"] = "將所有玩家新增至黑名單",
            ["all_blacklist_title"] = "將所有玩家新增至黑名單",
            ["reset_all_colors"] = "重設所有顏色",
            ["reset_all_colors_title"] = "重設所有顏色",
            ["text_color"] = "文字顏色",
            ["background_color"] = "背景顏色",
            ["title_text_color"] = "標題文字顏色",
            ["title_color"] = "標題欄位顏色",
            ["button_color"] = "按鈕顏色",
            ["button_hover_color"] = "按鈕懸浮顏色",
            ["button_activate_color"] = "按下按鈕顏色",
            ["button_text_color"] = "按鈕文字顏色",
            ["input_text_color"] = "輸入框文字顏色",
            ["player_fft_color"] = "視窗動畫顏色",
            ["progress_bar_color"] = "進度條顏色",
            ["hud_text_color"] = "HUD文字顏色",
            ["hud_played_progress_bar_color"] = "HUD已播放進度條顏色",
            ["hud_unplayed_progress_bar_color"] = "HUD未播放進度條顏色",
            ["hud_fft_color"] = "HUD動畫顏色",
            ["contact"] = "聯絡Texas",
            ["donate"] = "贊助作者",
            ["lyricfailed"] = "無法取得 %name% 的歌詞",
            ["lyricfailed_detail"] = "無法取得 %name% 的歌詞（%msg%）",
            ["nolyric"] = "%name% 暫無歌詞",
            ["playerror"] = "無法播放 %name%",
            ["continue_error"] = "連續５次嘗試失敗，動作已停止",
            ["playerror_loop"] = "%name% 無法播放，切換至下一首",
            ["userinfofailed"] = "取得網易雲會員資料失敗",
            ["try_play"] = "嘗試播放",
            ["empty_playlist"] = "播放清單空白",
            ["3dplay_no_perm"] = "您沒有權限開啟外放",
            ["no_perm"] = "無權限",
            ["clipboard_msg"] = "已複製至剪貼版",
            ["clipboard_title"] = "複製成功",
            ["outdated"] = "（舊版本，不受支持）",
            ["modified"] = "（修改版，不受支持）",
            ["cm_usable"] = "嘗試使用Cloud Music",
            ["instruction"] = "你可以在聊天框輸入!cm或!cloudmusic打開網易云音樂播放器\n或者按下Alt+↓使用快捷鍵打開",
            ["verbose_help"] = "啟用網易雲播放器囉嗦模式"
        },
        ["en"] = {
            ["title"] = "Netease Cloud Music",
            ["success"] = "Success",
            ["warning"] = "Warning",
            ["error"] = "Error",
            ["ok"] = "OK",
            ["sure"] = "Sure",
            ["cancel"] = "Nope",
            ["open"] = "Open",
            ["close"] = "Close",
            ["fetch"] = "Fetch",
            ["play"] = "Play",
            ["pause"] = "Pause",
            ["volume"] = "Volume",
            ["login"] = "Login",
            ["search"] = "Search",
            ["back"] = "Back",
            ["author"] = "Author",
            ["welcome"] = "Welcome",
            ["profile"] = "My Profile",
            ["logout"] = "Log out",
            ["blocked"] = "Blocked",
            ["unblocked"] = "Allowed",
            ["top_left"] = "Top Left",
            ["top_right"] = "Top Right",
            ["bottom_left"] = "Bottom Left",
            ["bottom_right"] = "Bottom Right",
            ["login_title"] = "Login Netease Cloud Music",
            ["use_phone"] = "Use Phone Number",
            ["use_email"] = "Use Email",
            ["phone"] = "Phone Number",
            ["email"] = "Email",
            ["password"] = "Password",
            ["read_agreed"] = "I have read and agreed ",
            ["privacy_policy"] = "Privacy Policy",
            ["privacy_policy_warn"] = "To use this function you have to read and agree Privacy Policy",
            ["loginfailed"] = "Login failed",
            ["loginsuccess"] = "Login success! Welcome back, %name%",
            ["logoutsuccess"] = "Log out success",
            ["logoutfailed"] = "Log out failed",
            ["greeting"] = "Hello, %name%",
            ["wait"] = "Please wait...",
            ["user_details"] = "You subscribed %djRadioCount% radios\nFavourited %mvCount% MVs\nSubscribed %artistCount% artists\nCreated %createDjRadioCount% radios\nCreated %createdPlaylistCount% playlists\nFavourited %subPlaylistCount% playlists",
            ["signin"] = "Sign in",
            ["signinsuccess"] = "Sign in success\nYou got %point% points",
            ["signinfailed"] = "Sign in failed",
            ["fetch_failed"] = "Fetch failed",
            ["settings"] = "Settings",
            ["playlist_id"] = "Playlist ID",
            ["wrong_playlist_id"] = "Please input correct playlist ID",
            ["fetch_playlist_failed"] = "Failed to fetch playlist",
            ["search_song"] = "Search song",
            ["search_failed"] = "Search failed",
            ["searchresult"] = "Found %count% songs",
            ["daily_recommend"] = "Daily Recommend",
            ["fetch_daily_recommend_failed"] = "Failed to fetch daily recommend",
            ["my_playlists"] = "My Playlists",
            ["fetch_user_playlists_failed"] = "Failed to fetch user playlists",
            ["prev_page"] = "Prev Page",
            ["next_page"] = "Next Page",
            ["switch_page_failed"] = "Failed to switch page",
            ["song_name"] = "Song Name",
            ["artist"] = "Artist",
            ["album"] = "Album",
            ["song_id"] = "Song ID",
            ["empty_playlist_msg"] = "The playlist is empty",
            ["empty_playlist"] = "Empty playlist",
            ["next_play"] = "Play on next one",
            ["add_to_playlist"] = "Add to playlist",
            ["copy_songid"] = "Copy song ID",
            ["copy_songurl"] = "Copy song URL",
            ["add_selected_to_playlist"] = "Add selected songs to playlist",
            ["add_list_to_playlist"] = "Add all songs in this list to playlist",
            ["clear_list"] = "Clear this list",
            ["undo_warn"] = "This can't be undo, Are you sure?",
            ["sure_warn"] = "Are you sure to do this?",
            ["clear_song_list_title"] = "Clear song list",
            ["playlist_name"] = "Playlist Name",
            ["song_count"] = "Song Count",
            ["playlist_id"] = "Playlist ID",
            ["playlistfailed"] = "Failed to fetch playlist",
            ["add_playlist_to_playlist"] = "Add all songs in this playlist to playlist",
            ["copy_playlist_id"] = "Copy playlist ID",
            ["clear_songlist_title"] = "Clear song list",
            ["remove_selected_songs"] = "Remove selected songs",
            ["clear_playlist_title"] = "Clear playlist",
            ["trying_play"] = "Trying play...",
            ["buffering"] = "Buffering...",
            ["prev_song"] = "Previous",
            ["next_song"] = "Next",
            ["list_loop"] = "List Loop",
            ["single_loop"] = "Single Loop",
            ["random_play"] = "Random",
            ["list_play"] = "List Play",
            ["copy_link"] = "Copy Link",
            ["disable_volume_enhance"] = "Disable Volume Enhance",
            ["enable_volume_enhance"] = "Enable Volume Enhance",
            ["display_ui_fft"] = "Display FFT in UI",
            ["display_hud_fft"] = "Display FFT in HUD",
            ["hud_fft_warn"] = "(might effect FPS sometimes)",
            ["display_lyric"] = "Display lyric",
            ["enable_animation"] = "Enable animation",
            ["enable_3dplay"] = "Enable 3D Play",
            ["bypass_3dplay"] = "Bypass 3D Play from others",
            ["center_lyric"] = "Display centered lyric in the bottom of the game",
            ["hud_pos"] = "HUD Position",
            ["use_server_link"] = "Use server to fetch link",
            ["use_server_link_tip"] = "You need to turn on this and login in to your VIP Netease Cloud Music account to liten to VIP songs",
            ["hud_text_shadow"] = "HUD Text shadow",
            ["ui_color"] = "UI Color",
            ["player_list"] = "Player List",
            ["custom_css"] = "Custom HUD CSS",
            ["description"] = "This player made by Texas, The lyrics used Cloudflare Worker to process.",
            ["advice"] = "Recommend set your game resolution to 1366x768 or higher",
            ["lyric_size"] = "Lyric size",
            ["player_name"] = "Player Name",
            ["blacklist"] = "Blacked?",
            ["add_remove_blacklist"] = "Add to/Remove from blacklist",
            ["copy_player_name"] = "Copy name",
            ["copy_steamid"] = "Copy Steam ID",
            ["remove_all_blacklist"] = "Remove all players that in blacklist",
            ["clear_blacklist_title"] = "Clear blacklist",
            ["add_all_players_to_blacklist"] = "Add all players to blacklist",
            ["all_blacklist_title"] = "Add all players to blacklist",
            ["reset_all_colors"] = "Reset all colors",
            ["reset_all_colors_title"] = "Reset all UI colors",
            ["text_color"] = "Text color",
            ["background_color"] = "Background color",
            ["title_text_color"] = "Title text color",
            ["title_color"] = "Title color",
            ["button_color"] = "Button color",
            ["button_hover_color"] = "Button hover color",
            ["button_activate_color"] = "Button active color",
            ["button_text_color"] = "Button text color",
            ["input_text_color"] = "Input box text color",
            ["player_fft_color"] = "FFT in UI color",
            ["progress_bar_color"] = "Progress bar color",
            ["hud_text_color"] = "HUD Text color",
            ["hud_played_progress_bar_color"] = "HUD Played progress bar color",
            ["hud_unplayed_progress_bar_color"] = "HUD Unplayed progress bar color",
            ["hud_fft_color"] = "HUD FFT Color",
            ["contact"] = "Contact Texas",
            ["donate"] = "Donate Me",
            ["lyricfailed"] = "Failed to fetch %name%'s lyric",
            ["lyricfailed_detail"] = "Failed to fetch %name%'s lyric (%msg%)",
            ["nolyric"] = "%name% has no lyric",
            ["playerror"] = "Can't play %name%",
            ["continue_error"] = "Continue failed to play for 5 times, stop trying",
            ["playerror_loop"] = "Because %name% can't play, switched to next song",
            ["userinfofailed"] = "Failed to fetch account information",
            ["try_play"] = "Try to play",
            ["empty_playlist"] = "The playlist is empty",
            ["3dplay_no_perm"] = "You don't have permission to turn on 3D Play",
            ["no_perm"] = "No permission",
            ["clipboard_msg"] = "Copied to clipboard",
            ["clipboard_title"] = "Copy success",
            ["outdated"] = " (Outdated Version, No support provided)",
            ["modified"] = " (Modified Version, No support provided)",
            ["cm_usable"] = "Try to use Cloud Music",
            ["instruction"] = "You can type !cm or !cloudmusic in chatbox to open Cloud Music player\nor press Alt+↓ to open it with shortcut keys",
            ["verbose_help"] = "Enable verbose mode of Cloud Music player"
        }
    }
    local I18N_LIST = {}
    local function GetText(name,...)
        local text = (LANGUAGES[GetConVar("gmod_language"):GetString()] or LANGUAGES['en'])[name] or name
        for _,v in pairs{...} do
            text = string.Replace(text,"%"..v[1].."%",v[2])
        end
        return text
    end
    local CLOUDMUSIC_SETTING_FILE_VER = "1.2.0" -- DO NOT modify unless you know WHAT ARE YOU DOING
    CreateClientConVar("cloudmusic_verbose", "0", true, false, GetText("verbose_help"))
    if file.Exists("materials/gwenskin/windows10.png", "GAME") then
        --Windows 10 UI Skin by Spar
        local surface=surface;local Color=Color;SKIN={}SKIN.PrintName="Windows 10"SKIN.Author="Spar"SKIN.DermaVersion=1;SKIN.GwenTexture=Material("gwenskin/windows10.png")SKIN.text_dark=Color(0,0,0,255)SKIN.colTextEntryText=Color(0,0,0,255)SKIN.colTextEntryTextHighlight=Color(0,120,215,255)SKIN.colTextEntryTextCursor=Color(0,0,0,255)SKIN.colTextEntryTextPlaceholder=Color(109,109,109,255)SKIN.tex={}SKIN.tex.Selection=GWEN.CreateTextureBorder(384,32,31,31,4,4,4,4)SKIN.tex.Panels={}SKIN.tex.Panels.Normal=GWEN.CreateTextureBorder(256,0,63,63,16,16,16,16)SKIN.tex.Panels.Bright=GWEN.CreateTextureBorder(256+64,0,63,63,16,16,16,16)SKIN.tex.Panels.Dark=GWEN.CreateTextureBorder(256,64,63,63,16,16,16,16)SKIN.tex.Panels.Highlight=GWEN.CreateTextureBorder(256+64,64,63,63,16,16,16,16)SKIN.tex.Button=GWEN.CreateTextureBorder(480,0,31,31,8,8,8,8)SKIN.tex.Button_Hovered=GWEN.CreateTextureBorder(480,32,31,31,8,8,8,8)SKIN.tex.Button_Dead=GWEN.CreateTextureBorder(480,64,31,31,8,8,8,8)SKIN.tex.Button_Down=GWEN.CreateTextureBorder(480,96,31,31,8,8,8,8)SKIN.tex.Shadow=GWEN.CreateTextureBorder(448,0,31,31,8,8,8,8)SKIN.tex.Tree=GWEN.CreateTextureBorder(256,128,127,127,16,16,16,16)SKIN.tex.Checkbox_Checked=GWEN.CreateTextureNormal(448,32,15,15)SKIN.tex.Checkbox=GWEN.CreateTextureNormal(464,32,15,15)SKIN.tex.CheckboxD_Checked=GWEN.CreateTextureNormal(448,48,15,15)SKIN.tex.CheckboxD=GWEN.CreateTextureNormal(464,48,15,15)SKIN.tex.RadioButton_Checked=GWEN.CreateTextureNormal(448,64,15,15)SKIN.tex.RadioButton=GWEN.CreateTextureNormal(464,64,15,15)SKIN.tex.RadioButtonD_Checked=GWEN.CreateTextureNormal(448,80,15,15)SKIN.tex.RadioButtonD=GWEN.CreateTextureNormal(464,80,15,15)SKIN.tex.TreePlus=GWEN.CreateTextureNormal(448,96,15,15)SKIN.tex.TreeMinus=GWEN.CreateTextureNormal(464,96,15,15)SKIN.tex.TextBox=GWEN.CreateTextureBorder(0,150,127,21,4,4,4,4)SKIN.tex.TextBox_Focus=GWEN.CreateTextureBorder(0,172,127,21,4,4,4,4)SKIN.tex.TextBox_Disabled=GWEN.CreateTextureBorder(0,194,127,21,4,4,4,4)SKIN.tex.MenuBG_Column=GWEN.CreateTextureBorder(128,128,127,63,24,8,8,8)SKIN.tex.MenuBG=GWEN.CreateTextureBorder(128,192,127,63,8,8,8,8)SKIN.tex.MenuBG_Hover=GWEN.CreateTextureBorder(128,256,127,31,8,8,8,8)SKIN.tex.MenuBG_Spacer=GWEN.CreateTextureNormal(128,288,127,3)SKIN.tex.Menu_Strip=GWEN.CreateTextureBorder(0,128,127,21,8,8,8,8)SKIN.tex.Menu_Check=GWEN.CreateTextureNormal(448,112,15,15)SKIN.tex.Tab_Control=GWEN.CreateTextureBorder(0,256,127,127,8,8,8,8)SKIN.tex.TabB_Active=GWEN.CreateTextureBorder(0,416,63,31,8,8,8,8)SKIN.tex.TabB_Inactive=GWEN.CreateTextureBorder(128,416,63,31,8,8,8,8)SKIN.tex.TabT_Active=GWEN.CreateTextureBorder(0,384,63,31,8,8,8,8)SKIN.tex.TabT_Inactive=GWEN.CreateTextureBorder(128,384,63,31,8,8,8,8)SKIN.tex.TabL_Active=GWEN.CreateTextureBorder(64,384,31,63,8,8,8,8)SKIN.tex.TabL_Inactive=GWEN.CreateTextureBorder(64+128,384,31,63,8,8,8,8)SKIN.tex.TabR_Active=GWEN.CreateTextureBorder(96,384,31,63,8,8,8,8)SKIN.tex.TabR_Inactive=GWEN.CreateTextureBorder(96+128,384,31,63,8,8,8,8)SKIN.tex.Tab_Bar=GWEN.CreateTextureBorder(128,352,127,31,4,4,4,4)SKIN.tex.Window={}SKIN.tex.Window.Normal=GWEN.CreateTextureBorder(0,0,127,127,8,24,8,8)SKIN.tex.Window.Inactive=GWEN.CreateTextureBorder(128,0,127,127,8,24,8,8)SKIN.tex.Window.Close=GWEN.CreateTextureNormal(32,448,31,24)SKIN.tex.Window.Close_Hover=GWEN.CreateTextureNormal(64,448,31,24)SKIN.tex.Window.Close_Down=GWEN.CreateTextureNormal(96,448,31,24)SKIN.tex.Window.Maxi=GWEN.CreateTextureNormal(32+96*2,448,31,24)SKIN.tex.Window.Maxi_Hover=GWEN.CreateTextureNormal(64+96*2,448,31,24)SKIN.tex.Window.Maxi_Down=GWEN.CreateTextureNormal(96+96*2,448,31,24)SKIN.tex.Window.Restore=GWEN.CreateTextureNormal(32+96*2,448+32,31,24)SKIN.tex.Window.Restore_Hover=GWEN.CreateTextureNormal(64+96*2,448+32,31,24)SKIN.tex.Window.Restore_Down=GWEN.CreateTextureNormal(96+96*2,448+32,31,24)SKIN.tex.Window.Mini=GWEN.CreateTextureNormal(32+96,448,31,24)SKIN.tex.Window.Mini_Hover=GWEN.CreateTextureNormal(64+96,448,31,24)SKIN.tex.Window.Mini_Down=GWEN.CreateTextureNormal(96+96,448,31,24)SKIN.tex.Scroller={}SKIN.tex.Scroller.TrackV=GWEN.CreateTextureBorder(384,208,15,127,4,4,4,4)SKIN.tex.Scroller.ButtonV_Normal=GWEN.CreateTextureBorder(384+16,208,15,127,4,4,4,4)SKIN.tex.Scroller.ButtonV_Hover=GWEN.CreateTextureBorder(384+32,208,15,127,4,4,4,4)SKIN.tex.Scroller.ButtonV_Down=GWEN.CreateTextureBorder(384+48,208,15,127,4,4,4,4)SKIN.tex.Scroller.ButtonV_Disabled=GWEN.CreateTextureBorder(384+64,208,15,127,4,4,4,4)SKIN.tex.Scroller.TrackH=GWEN.CreateTextureBorder(384,128,127,15,4,4,4,4)SKIN.tex.Scroller.ButtonH_Normal=GWEN.CreateTextureBorder(384,128+16,127,15,4,4,4,4)SKIN.tex.Scroller.ButtonH_Hover=GWEN.CreateTextureBorder(384,128+32,127,15,4,4,4,4)SKIN.tex.Scroller.ButtonH_Down=GWEN.CreateTextureBorder(384,128+48,127,15,4,4,4,4)SKIN.tex.Scroller.ButtonH_Disabled=GWEN.CreateTextureBorder(384,128+64,127,15,4,4,4,4)SKIN.tex.Scroller.LeftButton_Normal=GWEN.CreateTextureBorder(464,208,15,15,2,2,2,2)SKIN.tex.Scroller.LeftButton_Hover=GWEN.CreateTextureBorder(480,208,15,15,2,2,2,2)SKIN.tex.Scroller.LeftButton_Down=GWEN.CreateTextureBorder(464,272,15,15,2,2,2,2)SKIN.tex.Scroller.LeftButton_Disabled=GWEN.CreateTextureBorder(480+48,272,15,15,2,2,2,2)SKIN.tex.Scroller.UpButton_Normal=GWEN.CreateTextureBorder(464,208+16,15,15,2,2,2,2)SKIN.tex.Scroller.UpButton_Hover=GWEN.CreateTextureBorder(480,208+16,15,15,2,2,2,2)SKIN.tex.Scroller.UpButton_Down=GWEN.CreateTextureBorder(464,272+16,15,15,2,2,2,2)SKIN.tex.Scroller.UpButton_Disabled=GWEN.CreateTextureBorder(480+48,272+16,15,15,2,2,2,2)SKIN.tex.Scroller.RightButton_Normal=GWEN.CreateTextureBorder(464,208+32,15,15,2,2,2,2)SKIN.tex.Scroller.RightButton_Hover=GWEN.CreateTextureBorder(480,208+32,15,15,2,2,2,2)SKIN.tex.Scroller.RightButton_Down=GWEN.CreateTextureBorder(464,272+32,15,15,2,2,2,2)SKIN.tex.Scroller.RightButton_Disabled=GWEN.CreateTextureBorder(480+48,272+32,15,15,2,2,2,2)SKIN.tex.Scroller.DownButton_Normal=GWEN.CreateTextureBorder(464,208+48,15,15,2,2,2,2)SKIN.tex.Scroller.DownButton_Hover=GWEN.CreateTextureBorder(480,208+48,15,15,2,2,2,2)SKIN.tex.Scroller.DownButton_Down=GWEN.CreateTextureBorder(464,272+48,15,15,2,2,2,2)SKIN.tex.Scroller.DownButton_Disabled=GWEN.CreateTextureBorder(480+48,272+48,15,15,2,2,2,2)SKIN.tex.Menu={}SKIN.tex.Menu.RightArrow=GWEN.CreateTextureNormal(464,112,15,15)SKIN.tex.Input={}SKIN.tex.Input.ComboBox={}SKIN.tex.Input.ComboBox.Normal=GWEN.CreateTextureBorder(384,336,127,31,8,8,32,8)SKIN.tex.Input.ComboBox.Hover=GWEN.CreateTextureBorder(384,336+32,127,31,8,8,32,8)SKIN.tex.Input.ComboBox.Down=GWEN.CreateTextureBorder(384,336+64,127,31,8,8,32,8)SKIN.tex.Input.ComboBox.Disabled=GWEN.CreateTextureBorder(384,336+96,127,31,8,8,32,8)SKIN.tex.Input.ComboBox.Button={}SKIN.tex.Input.ComboBox.Button.Normal=GWEN.CreateTextureNormal(496,272,15,15)SKIN.tex.Input.ComboBox.Button.Hover=GWEN.CreateTextureNormal(496,272+16,15,15)SKIN.tex.Input.ComboBox.Button.Down=GWEN.CreateTextureNormal(496,272+32,15,15)SKIN.tex.Input.ComboBox.Button.Disabled=GWEN.CreateTextureNormal(496,272+48,15,15)SKIN.tex.Input.UpDown={}SKIN.tex.Input.UpDown.Up={}SKIN.tex.Input.UpDown.Up.Normal=GWEN.CreateTextureCentered(384,112,7,7)SKIN.tex.Input.UpDown.Up.Hover=GWEN.CreateTextureCentered(384+8,112,7,7)SKIN.tex.Input.UpDown.Up.Down=GWEN.CreateTextureCentered(384+16,112,7,7)SKIN.tex.Input.UpDown.Up.Disabled=GWEN.CreateTextureCentered(384+24,112,7,7)SKIN.tex.Input.UpDown.Down={}SKIN.tex.Input.UpDown.Down.Normal=GWEN.CreateTextureCentered(384,120,7,7)SKIN.tex.Input.UpDown.Down.Hover=GWEN.CreateTextureCentered(384+8,120,7,7)SKIN.tex.Input.UpDown.Down.Down=GWEN.CreateTextureCentered(384+16,120,7,7)SKIN.tex.Input.UpDown.Down.Disabled=GWEN.CreateTextureCentered(384+24,120,7,7)SKIN.tex.Input.Slider={}SKIN.tex.Input.Slider.H={}SKIN.tex.Input.Slider.H.Normal=GWEN.CreateTextureNormal(416,32,15,15)SKIN.tex.Input.Slider.H.Hover=GWEN.CreateTextureNormal(416,32+16,15,15)SKIN.tex.Input.Slider.H.Down=GWEN.CreateTextureNormal(416,32+32,15,15)SKIN.tex.Input.Slider.H.Disabled=GWEN.CreateTextureNormal(416,32+48,15,15)SKIN.tex.Input.Slider.V={}SKIN.tex.Input.Slider.V.Normal=GWEN.CreateTextureNormal(416+16,32,15,15)SKIN.tex.Input.Slider.V.Hover=GWEN.CreateTextureNormal(416+16,32+16,15,15)SKIN.tex.Input.Slider.V.Down=GWEN.CreateTextureNormal(416+16,32+32,15,15)SKIN.tex.Input.Slider.V.Disabled=GWEN.CreateTextureNormal(416+16,32+48,15,15)SKIN.tex.Input.ListBox={}SKIN.tex.Input.ListBox.Background=GWEN.CreateTextureBorder(256,256,63,127,8,8,8,8)SKIN.tex.Input.ListBox.Hovered=GWEN.CreateTextureBorder(320,320,31,31,8,8,8,8)SKIN.tex.Input.ListBox.EvenLine=GWEN.CreateTextureBorder(352,256,31,31,8,8,8,8)SKIN.tex.Input.ListBox.OddLine=GWEN.CreateTextureBorder(352,288,31,31,8,8,8,8)SKIN.tex.Input.ListBox.EvenLineSelected=GWEN.CreateTextureBorder(320,256,31,31,8,8,8,8)SKIN.tex.Input.ListBox.OddLineSelected=GWEN.CreateTextureBorder(320,288,31,31,8,8,8,8)SKIN.tex.ProgressBar={}SKIN.tex.ProgressBar.Back=GWEN.CreateTextureBorder(384,0,31,31,8,8,8,8)SKIN.tex.ProgressBar.Front=GWEN.CreateTextureBorder(384+32,0,31,31,8,8,8,8)SKIN.tex.CategoryList={}SKIN.tex.CategoryList.Outer=GWEN.CreateTextureBorder(256,384,63,63,8,8,8,8)SKIN.tex.CategoryList.Inner=GWEN.CreateTextureBorder(320,384,63,63,8,21,8,8)SKIN.tex.CategoryList.Header=GWEN.CreateTextureBorder(320,352,63,31,8,8,8,8)SKIN.tex.Tooltip=GWEN.CreateTextureBorder(384,64,31,31,8,8,8,8)SKIN.Colours={}SKIN.Colours.Window={}SKIN.Colours.Window.TitleActive=GWEN.TextureColor(4+8*0,508)SKIN.Colours.Window.TitleInactive=GWEN.TextureColor(4+8*1,508)SKIN.Colours.Button={}SKIN.Colours.Button.Normal=GWEN.TextureColor(4+8*2,508)SKIN.Colours.Button.Hover=GWEN.TextureColor(4+8*3,508)SKIN.Colours.Button.Down=GWEN.TextureColor(4+8*2,500)SKIN.Colours.Button.Disabled=GWEN.TextureColor(4+8*3,500)SKIN.Colours.Tab={}SKIN.Colours.Tab.Active={}SKIN.Colours.Tab.Active.Normal=GWEN.TextureColor(4+8*4,508)SKIN.Colours.Tab.Active.Hover=GWEN.TextureColor(4+8*5,508)SKIN.Colours.Tab.Active.Down=GWEN.TextureColor(4+8*4,500)SKIN.Colours.Tab.Active.Disabled=GWEN.TextureColor(4+8*5,500)SKIN.Colours.Tab.Inactive={}SKIN.Colours.Tab.Inactive.Normal=GWEN.TextureColor(4+8*6,508)SKIN.Colours.Tab.Inactive.Hover=GWEN.TextureColor(4+8*7,508)SKIN.Colours.Tab.Inactive.Down=GWEN.TextureColor(4+8*6,500)SKIN.Colours.Tab.Inactive.Disabled=GWEN.TextureColor(4+8*7,500)SKIN.Colours.Label={}SKIN.Colours.Label.Default=GWEN.TextureColor(4+8*8,508)SKIN.Colours.Label.Bright=GWEN.TextureColor(4+8*9,508)SKIN.Colours.Label.Dark=GWEN.TextureColor(4+8*8,500)SKIN.Colours.Label.Highlight=GWEN.TextureColor(4+8*9,500)SKIN.Colours.Tree={}SKIN.Colours.Tree.Lines=GWEN.TextureColor(4+8*10,508)SKIN.Colours.Tree.Normal=GWEN.TextureColor(4+8*11,508)SKIN.Colours.Tree.Hover=GWEN.TextureColor(4+8*10,500)SKIN.Colours.Tree.Selected=GWEN.TextureColor(4+8*11,500)SKIN.Colours.Properties={}SKIN.Colours.Properties.Line_Normal=GWEN.TextureColor(4+8*12,508)SKIN.Colours.Properties.Line_Selected=GWEN.TextureColor(4+8*13,508)SKIN.Colours.Properties.Line_Hover=GWEN.TextureColor(4+8*12,500)SKIN.Colours.Properties.Title=GWEN.TextureColor(4+8*13,500)SKIN.Colours.Properties.Column_Normal=GWEN.TextureColor(4+8*14,508)SKIN.Colours.Properties.Column_Selected=GWEN.TextureColor(4+8*15,508)SKIN.Colours.Properties.Column_Hover=GWEN.TextureColor(4+8*14,500)SKIN.Colours.Properties.Border=GWEN.TextureColor(4+8*15,500)SKIN.Colours.Properties.Label_Normal=GWEN.TextureColor(4+8*16,508)SKIN.Colours.Properties.Label_Selected=GWEN.TextureColor(4+8*17,508)SKIN.Colours.Properties.Label_Hover=GWEN.TextureColor(4+8*16,500)SKIN.Colours.Category={}SKIN.Colours.Category.Header=GWEN.TextureColor(4+8*18,500)SKIN.Colours.Category.Header_Closed=GWEN.TextureColor(4+8*19,500)SKIN.Colours.Category.Line={}SKIN.Colours.Category.Line.Text=GWEN.TextureColor(4+8*20,508)SKIN.Colours.Category.Line.Text_Hover=GWEN.TextureColor(4+8*21,508)SKIN.Colours.Category.Line.Text_Selected=GWEN.TextureColor(4+8*20,500)SKIN.Colours.Category.Line.Button=GWEN.TextureColor(4+8*21,500)SKIN.Colours.Category.Line.Button_Hover=GWEN.TextureColor(4+8*22,508)SKIN.Colours.Category.Line.Button_Selected=GWEN.TextureColor(4+8*23,508)SKIN.Colours.Category.LineAlt={}SKIN.Colours.Category.LineAlt.Text=GWEN.TextureColor(4+8*22,500)SKIN.Colours.Category.LineAlt.Text_Hover=GWEN.TextureColor(4+8*23,500)SKIN.Colours.Category.LineAlt.Text_Selected=GWEN.TextureColor(4+8*24,508)SKIN.Colours.Category.LineAlt.Button=GWEN.TextureColor(4+8*25,508)SKIN.Colours.Category.LineAlt.Button_Hover=GWEN.TextureColor(4+8*24,500)SKIN.Colours.Category.LineAlt.Button_Selected=GWEN.TextureColor(4+8*25,500)SKIN.Colours.TooltipText=GWEN.TextureColor(4+8*26,500)function SKIN:PaintPanel(a,b,c)if not a.m_bBackground then return end;self.tex.Panels.Normal(0,0,b,c,a.m_bgColor)end;function SKIN:PaintShadow(a,b,c)SKIN.tex.Shadow(0,0,b,c)end;function SKIN:PaintFrame(a,b,c)if a.m_bPaintShadow then DisableClipping(true)self.tex.Shadow(-4,-4,b+10,c+10)DisableClipping(false)end;if a:HasHierarchicalFocus()then self.tex.Window.Normal(0,0,b,c)else self.tex.Window.Inactive(0,0,b,c)end end;function SKIN:PaintButton(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()or a:GetToggle()then return self.tex.Button_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Button_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Button_Hovered(0,0,b,c)end;self.tex.Button(0,0,b,c)end;function SKIN:PaintTree(a,b,c)if not a.m_bBackground then return end;self.tex.Tree(0,0,b,c,a.m_bgColor)end;function SKIN:PaintCheckBox(a,b,c)if a:GetChecked()then if a:GetDisabled()then self.tex.CheckboxD_Checked(0,0,b,c)else self.tex.Checkbox_Checked(0,0,b,c)end else if a:GetDisabled()then self.tex.CheckboxD(0,0,b,c)else self.tex.Checkbox(0,0,b,c)end end end;function SKIN:PaintExpandButton(a,b,c)if not a:GetExpanded()then self.tex.TreePlus(0,0,b,c)else self.tex.TreeMinus(0,0,b,c)end end;function SKIN:PaintTextEntry(a,b,c)if a.m_bBackground then if a:GetDisabled()then self.tex.TextBox_Disabled(0,0,b,c)elseif a:HasFocus()then self.tex.TextBox_Focus(0,0,b,c)else self.tex.TextBox(0,0,b,c)end end;if a.GetPlaceholderText and a.GetPlaceholderColor and a:GetPlaceholderText()and a:GetPlaceholderText():Trim()~=""and a:GetPlaceholderColor()and(not a:GetText()or a:GetText()=="")then local d=a:GetText()local e=a:GetPlaceholderText()if e:StartWith("#")then e=e:sub(2)end;e=language.GetPhrase(e)a:SetText(e)a:DrawTextEntryText(a:GetPlaceholderColor(),a:GetHighlightColor(),a:GetCursorColor())a:SetText(d)return end;a:DrawTextEntryText(a:GetTextColor(),a:GetHighlightColor(),a:GetCursorColor())end;function SKIN:PaintMenu(a,b,c)if a:GetDrawColumn()then self.tex.MenuBG_Column(0,0,b,c)else self.tex.MenuBG(0,0,b,c)end end;function SKIN:PaintMenuSpacer(a,b,c)surface.SetDrawColor(Color(0,0,0,100))surface.DrawRect(0,0,b,c)end;function SKIN:PaintMenuOption(a,b,c)if a.m_bBackground and(a.Hovered or a.Highlight)then self.tex.MenuBG_Hover(0,0,b,c)end;if a:GetChecked()then self.tex.Menu_Check(5,c/2-7,15,15)end end;function SKIN:PaintMenuRightArrow(a,b,c)self.tex.Menu.RightArrow(0,0,b,c)end;function SKIN:PaintPropertySheet(a,b,c)local f=a:GetActiveTab()local g=0;if f then g=f:GetTall()-8 end;self.tex.Tab_Control(0,g,b,c-g)end;function SKIN:PaintTab(a,b,c)if a:IsActive()then return self:PaintActiveTab(a,b,c)end;self.tex.TabT_Inactive(0,0,b,c)end;function SKIN:PaintActiveTab(a,b,c)self.tex.TabT_Active(0,0,b,c)end;function SKIN:PaintWindowCloseButton(a,b,c)if not a.m_bBackground then return end;if a:GetDisabled()then return self.tex.Window.Close(0,0,b,c,Color(255,255,255,50))end;if a.Depressed or a:IsSelected()then return self.tex.Window.Close_Down(0,0,b,c)end;if a.Hovered then return self.tex.Window.Close_Hover(0,0,b,c)end;self.tex.Window.Close(0,0,b,c)end;function SKIN:PaintWindowMinimizeButton(a,b,c)if not a.m_bBackground then return end;if a:GetDisabled()then return self.tex.Window.Mini(0,0,b,c,Color(255,255,255,50))end;if a.Depressed or a:IsSelected()then return self.tex.Window.Mini_Down(0,0,b,c)end;if a.Hovered then return self.tex.Window.Mini_Hover(0,0,b,c)end;self.tex.Window.Mini(0,0,b,c)end;function SKIN:PaintWindowMaximizeButton(a,b,c)if not a.m_bBackground then return end;if a:GetDisabled()then return self.tex.Window.Maxi(0,0,b,c,Color(255,255,255,50))end;if a.Depressed or a:IsSelected()then return self.tex.Window.Maxi_Down(0,0,b,c)end;if a.Hovered then return self.tex.Window.Maxi_Hover(0,0,b,c)end;self.tex.Window.Maxi(0,0,b,c)end;function SKIN:PaintVScrollBar(a,b,c)self.tex.Scroller.TrackV(0,0,b,c)end;function SKIN:PaintScrollBarGrip(a,b,c)if a:GetDisabled()then return self.tex.Scroller.ButtonV_Disabled(0,0,b,c)end;if a.Depressed then return self.tex.Scroller.ButtonV_Down(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.ButtonV_Hover(0,0,b,c)end;return self.tex.Scroller.ButtonV_Normal(0,0,b,c)end;function SKIN:PaintButtonDown(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()then return self.tex.Scroller.DownButton_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Scroller.DownButton_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.DownButton_Hover(0,0,b,c)end;self.tex.Scroller.DownButton_Normal(0,0,b,c)end;function SKIN:PaintButtonUp(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()then return self.tex.Scroller.UpButton_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Scroller.UpButton_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.UpButton_Hover(0,0,b,c)end;self.tex.Scroller.UpButton_Normal(0,0,b,c)end;function SKIN:PaintButtonLeft(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()then return self.tex.Scroller.LeftButton_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Scroller.LeftButton_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.LeftButton_Hover(0,0,b,c)end;self.tex.Scroller.LeftButton_Normal(0,0,b,c)end;function SKIN:PaintButtonRight(a,b,c)if not a.m_bBackground then return end;if a.Depressed or a:IsSelected()then return self.tex.Scroller.RightButton_Down(0,0,b,c)end;if a:GetDisabled()then return self.tex.Scroller.RightButton_Dead(0,0,b,c)end;if a.Hovered then return self.tex.Scroller.RightButton_Hover(0,0,b,c)end;self.tex.Scroller.RightButton_Normal(0,0,b,c)end;function SKIN:PaintComboDownArrow(a,b,c)if a.ComboBox:GetDisabled()then return self.tex.Input.ComboBox.Button.Disabled(0,0,b,c)end;if a.ComboBox.Depressed or a.ComboBox:IsMenuOpen()then return self.tex.Input.ComboBox.Button.Down(0,0,b,c)end;if a.ComboBox.Hovered then return self.tex.Input.ComboBox.Button.Hover(0,0,b,c)end;self.tex.Input.ComboBox.Button.Normal(0,0,b,c)end;function SKIN:PaintComboBox(a,b,c)if a:GetDisabled()then return self.tex.Input.ComboBox.Disabled(0,0,b,c)end;if a.Depressed or a:IsMenuOpen()then return self.tex.Input.ComboBox.Down(0,0,b,c)end;if a.Hovered then return self.tex.Input.ComboBox.Hover(0,0,b,c)end;self.tex.Input.ComboBox.Normal(0,0,b,c)end;function SKIN:PaintListBox(a,b,c)self.tex.Input.ListBox.Background(0,0,b,c)end;function SKIN:PaintNumberUp(a,b,c)if a:GetDisabled()then return self.tex.Input.UpDown.Up.Disabled(0,0,b,c)end;if a.Depressed then return self.tex.Input.UpDown.Up.Down(0,0,b,c)end;if a.Hovered then return self.tex.Input.UpDown.Up.Hover(0,0,b,c)end;self.tex.Input.UpDown.Up.Normal(0,0,b,c)end;function SKIN:PaintNumberDown(a,b,c)if a:GetDisabled()then return self.tex.Input.UpDown.Down.Disabled(0,0,b,c)end;if a.Depressed then return self.tex.Input.UpDown.Down.Down(0,0,b,c)end;if a.Hovered then return self.tex.Input.UpDown.Down.Hover(0,0,b,c)end;self.tex.Input.UpDown.Down.Normal(0,0,b,c)end;function SKIN:PaintTreeNode(a,b,c)if not a.m_bDrawLines then return end;surface.SetDrawColor(self.Colours.Tree.Lines)if a.m_bLastChild then surface.DrawRect(9,0,1,7)surface.DrawRect(9,7,9,1)else surface.DrawRect(9,0,1,c)surface.DrawRect(9,7,9,1)end end;function SKIN:PaintTreeNodeButton(a,b,c)if not a.m_bSelected then return end;local b,h=a:GetTextSize()self.tex.Selection(38,0,b+6,c)end;function SKIN:PaintSelection(a,b,c)self.tex.Selection(0,0,b,c)end;function SKIN:PaintSliderKnob(a,b,c)if a:GetDisabled()then return self.tex.Input.Slider.H.Disabled(0,0,b,c)end;if a.Depressed then return self.tex.Input.Slider.H.Down(0,0,b,c)end;if a.Hovered then return self.tex.Input.Slider.H.Hover(0,0,b,c)end;self.tex.Input.Slider.H.Normal(0,0,b,c)end;local function i(j,k,b,c,l)if not l then return end;local m=b/l;for n=0,l do surface.DrawRect(j+n*m,k+4,1,5)end end;function SKIN:PaintNumSlider(a,b,c)surface.SetDrawColor(Color(0,0,0,100))surface.DrawRect(8,c/2-1,b-15,1)i(8,c/2-1,b-16,1,a.m_iNotches)end;function SKIN:PaintProgress(a,b,c)self.tex.ProgressBar.Back(0,0,b,c)self.tex.ProgressBar.Front(0,0,b*a:GetFraction(),c)end;function SKIN:PaintCollapsibleCategory(a,b,c)if c<21 then return self.tex.CategoryList.Header(0,0,b,c)end;self.tex.CategoryList.Inner(0,0,b,63)end;function SKIN:PaintCategoryList(a,b,c)self.tex.CategoryList.Outer(0,0,b,c)end;function SKIN:PaintCategoryButton(a,b,c)if a.AltLine then if a.Depressed or a.m_bSelected then surface.SetDrawColor(self.Colours.Category.LineAlt.Button_Selected)elseif a.Hovered then surface.SetDrawColor(self.Colours.Category.LineAlt.Button_Hover)else surface.SetDrawColor(self.Colours.Category.LineAlt.Button)end else if a.Depressed or a.m_bSelected then surface.SetDrawColor(self.Colours.Category.Line.Button_Selected)elseif a.Hovered then surface.SetDrawColor(self.Colours.Category.Line.Button_Hover)else surface.SetDrawColor(self.Colours.Category.Line.Button)end end;surface.DrawRect(0,0,b,c)end;function SKIN:PaintListViewLine(a,b,c)if a:IsSelected()then self.tex.Input.ListBox.EvenLineSelected(0,0,b,c)elseif a.Hovered then self.tex.Input.ListBox.Hovered(0,0,b,c)elseif a.m_bAlt then self.tex.Input.ListBox.EvenLine(0,0,b,c)end end;function SKIN:PaintListView(a,b,c)if not a.m_bBackground then return end;self.tex.Input.ListBox.Background(0,0,b,c)end;function SKIN:PaintTooltip(a,b,c)self.tex.Tooltip(0,0,b,c)end;function SKIN:PaintMenuBar(a,b,c)self.tex.Menu_Strip(0,0,b,c)end;derma.DefineSkin("CloudMusicDermaSkin","Windows 10 UI used by CloudMusic",SKIN)
    end
    print("===========================\n")
    print("    Cloud Music for LUA    \n")
    print("         By  Texas         \n")
    print("===========================")
    Print("Initializing CloudMusic "..CLOUDMUSIC_VER)
    cvars.RemoveChangeCallback("gmod_language", "CloudMusicLanguageDetect")
    local function Init()
        I18N_LIST = {}
        if CloudMusic and CloudMusic.Remove then
            local players = player.GetAll()
            for i=1,#players do
                local p = players[i]
                p.ChannelCreating = false
                if IsValid(p.CM_MusicChannel) then
                    p.CM_MusicChannel:Stop()
                    p.CM_MusicChannel = nil
                end
            end
            if CloudMusic.CurrentChannel then
                CloudMusic.CurrentChannel:Stop()
            end
            if CloudMusic.HUD and CloudMusic.HUD.Remove then
                CloudMusic.HUD:Remove()
            end
            CloudMusic:Remove()
            CloudMusic = nil
        end
        if not file.Exists("cloudmusic", "DATA") or not file.IsDir("cloudmusic", "DATA") then
            file.CreateDir("cloudmusic")
        end
        local settingFilePath = "cloudmusic/settings."..CLOUDMUSIC_SETTING_FILE_VER..".dat"
        local function GetStringTableKeys(t)
            local keys = {}
            for k,_ in ipairs(t) do
                table.insert(keys,k)
            end
            return keys
        end
        local settings = {
            ["CloudMusicPlayMode"] = "ListLoop",
            ["CloudMusicUseServer"] = true,
            ["CloudMusicAnimation"] = true,
            ["CloudMusic3D"] = false,
            ["CloudMusicLyric"] = true,
            ["CloudMusicBypass3D"] = false,
            ["CloudMusicFFT"] = true,
            ["CloudMusicHUDFFT"] = false,
            ["CloudMusicVolume"] = 1,
            ["CloudMusicVolumeEnhance"] = false,
            ["CloudMusicHUDTextShadow"] = true,
            ["CloudMusicPublicInfo"] = true,
            ["CloudMusicLyricCentered"] = false,
            ["CloudMusicLyricSize"] = 18,
            ["CloudMusicHUDTextColor"] = Color(255,255,255),
            ["CloudMusicHUDProgressUnplayedColor"] = Color(255,255,255),
            ["CloudMusicHUDProgressPlayedColor"] = Color(102,204,255),
            ["CloudMusicHUDFFTColor"] = Color(255,255,255),
            ["CloudMusicTextColor"] = Color(0,0,0),
            ["CloudMusicButtonTextColor"] = Color(255,255,255),
            ["CloudMusicButtonColor"] = Color(102,204,255),
            ["CloudMusicButtonHoverColor"] = Color(0,153,230),
            ["CloudMusicButtonActivateColor"] = Color(0,86,130),
            ["CloudMusicTextEntryColor"] = Color(0,0,0),
            ["CloudMusicPlayerFFTColor"] = Color(0,0,0),
            ["CloudMusicBarColor"] = Color(102,204,255),
            ["CloudMusicBackgroundColor"] = Color(255,255,255),
            ["CloudMusicTitleBarColor"] = Color(102,204,255),
            ["CloudMusicTitleBarTextColor"] = Color(255,255,255),
            ["CloudMusicHudPos"] = "top-left",
            ["CloudMusicHUDCustomCSS"] = "",
            ["CloudMusicBlacklistUsers"] = {},
            ["CloudMusicPlaylist"] = {},
            ["CloudMusicUserToken"] = ""
        }
        local function SaveSettings(set)
            local temp = table.Copy(settings)
            temp["version"] = CLOUDMUSIC_SETTING_FILE_VER
            file.Write(settingFilePath, util.TableToJSON(temp))
            Print("User settings saved")
        end
        local defaultSettings = table.Copy(settings)
        local defaultKeys = GetStringTableKeys(defaultSettings)
        if not file.Exists(settingFilePath, "DATA") then
            SaveSettings()
            Print("No settings file, creating a new file")
        else
            local json = util.JSONToTable(file.Read(settingFilePath))
            if not json then
                SaveSettings()
                Print("Invalid settings file, resetting settings file")
            else
                if json["version"] ~= CLOUDMUSIC_SETTING_FILE_VER then
                    SaveSettings()
                    json = settings
                    Print("Settings file version is different from current version, resetting setttings file")
                end
                local jsonKeys = GetStringTableKeys(json)
                for i=1,#jsonKeys do
                    if jsonKeys[i] == "version" then
                        table.remove(json, i)
                    end
                    if not table.HasValue(defaultKeys, jsonKeys[i]) then
                        table.remove(json, i)
                    end
                end
                for i=1,#defaultKeys do
                    if not table.HasValue(jsonKeys, defaultKeys[i]) then
                        json[defaultKeys[i]] = settings[defaultKeys[i]]
                    end
                end
                settings = json
                SaveSettings()
                Print("User settings loaded")
            end
        end
        local function GetSettings(name)
            return settings[name]
        end
        local function SetSettings(name,value)
            settings[name] = value
            Print(name.." set to "..tostring(value))
            SaveSettings()
            return value
        end
        local winw,winh = ScrW()*0.8,ScrH()*0.7
        local targetOpacity = 0
        local isDragging = false
        local isProgDragging = false
        local isVolDragging = false
        local lrc = nil
        local transLrc = nil
        local currentShowingPage = "Main"
        local slideAnimPix = winw/10
        local msg = ""
        local lrcStartPos = 1
        local transLrcStartPos = 1
        local errorCount = 0
        local buffering = false
        local playerNoticed = false
        local userDetail = {}
        local channelPlayers = {}
        Print("Variables set up")
        local I18N_TEXT = 0
        local I18N_PLACEHOLDER = 1
        local I18N_VALUE = 2
        local I18N_COLUMN = 3
        local function LanguageUpdate()
            local lang = GetConVar("gmod_language"):GetString()
            for _,c in ipairs(I18N_LIST) do
                if IsValid(c) then
                    local params = {}
                    if type(c.I18NParams) == "table" then
                        for k,v in pairs(c.I18NParams) do
                            table.insert(params, {k,v})
                        end
                    end
                    if c.SetText and c.I18NType == I18N_TEXT then c:SetText(GetText(c.I18Name,unpack(params))) end
                    if c.SetPlaceholderText and c.I18NType == I18N_PLACEHOLDER then c:SetPlaceholderText(GetText(c.I18Name,unpack(params))) end
                    if c.SetValue and c.I18NType == I18N_VALUE then c:SetValue(GetText(c.I18Name,unpack(params))) end
                    if c.SetName and c.I18NType == I18N_COLUMN then c:SetName(GetText(c.I18Name,unpack(params))) end
                    if c.LangUpdate then c:LangUpdate() end
                else
                    table.RemoveByValue(I18N_LIST, c)
                end
            end
        end
        local vgui = vgui
        vgui.__oldCreate = vgui.__oldCreate or vgui.Create
        function vgui.Create(c,p,n,...)
            local r = vgui.__oldCreate(c,p,n,...)
            function r:SetI18N(strname,type)
                if self.I18Name == strname and self.I18NType == (type or I18N_TEXT) then return end
                if not table.HasValue(I18N_LIST,self) then
                    table.insert(I18N_LIST,self)
                end
                self.I18Name = strname
                self.I18NType = type or I18N_TEXT
                LanguageUpdate()
            end
            function r:RemoveI18N()
                table.RemoveByValue(I18N_LIST, self)
            end
            return r
        end
        Print("Multi-language ready")
        surface.CreateFont("CloudMusicTitle", {
            font = "Microsoft YaHei",
            extended = true,
            size = 24,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        surface.CreateFont("CloudMusicSubTitle", {
            font = "Microsoft YaHei",
            extended = true,
            size = 22,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        surface.CreateFont("CloudMusicSmallTitle", {
            font = "Microsoft YaHei",
            extended = true,
            size = 18,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        surface.CreateFont("CloudMusicText", {
            font = "Microsoft YaHei",
            extended = true,
            size = 16,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        surface.CreateFont("CloudMusicDermaText", {
            font = "Microsoft YaHei",
            extended = true,
            size = 17,
            weight = 500,
            blursize = 0,
            scanlines = 0,
            antialias = true,
            underline = false,
            italic = false,
            strikeout = false,
            symbol = false,
            rotary = false,
            shadow = false,
            additive = false,
            outline = false,
        })
        Print("Fonts created")
        CM_VER_OK = 0
        CM_VER_OUDATED = 1
        CM_VER_MODIFIED = 2
        local cmStatus = CM_VER_OK
        local function CheckVersion()
            Print("Checking Cloud Music version...")
            local lua = file.Read("autorun/cloudmusic.lua","LUA")
            http.Fetch("https://cm.luotianyi.me/version.php",function(body)
                local json = util.JSONToTable(body)
                if json["version"] ~= CLOUDMUSIC_VER then
                    Print("CloudMusic is outdated, please update to latest version")
                    cmStatus = CM_VER_OUDATED
                elseif json["content"] ~= lua then
                    Print("CloudMusic is modified, this copy of Cloud Music won't get support of developer")
                    cmStatus = CM_VER_MODIFIED
                else
                    Print("CloudMusic is up to date")
                    cmStatus = CM_VER_OK
                end
            end)
        end
        local function TextMessage(str)
            msg = str
            timer.Simple(10, function()msg = "" end)
        end
        local function AddMessage(message,title,timeout,type)
            local title = title or ""
            local timeout = timeout or 3000
            local type = type or ""
            CloudMusic.HUD:RunJavascript([[
                addMessage("]]..tostring(message):JavascriptSafe()..[[","]]..tostring(title):JavascriptSafe()..[[",]]..tostring(timeout):JavascriptSafe()..[[,"]]..tostring(type):JavascriptSafe()..[[");
            ]]);
        end
        local function AddProgress(name,message,title)
            if not name then return end
            local title = title or ""
            CloudMusic.HUD:RunJavascript([[
                addProgress("]]..tostring(name):JavascriptSafe()..[[","]]..tostring(message):JavascriptSafe()..[[","]]..tostring(title):JavascriptSafe()..[[");
            ]]);
        end
        local function RemoveProgress(name)
            if not name then return end
            CloudMusic.HUD:RunJavascript([[
                removeProgress("]]..tostring(name):JavascriptSafe()..[[");
            ]]);
        end
        local function FetchLyric()
            local currentPlaying = CloudMusic.CurrentPlaying
            lrc = nil
            transLrc = nil
            if not GetSettings("CloudMusicLyric") then return end
            lrcStartPos = 1
            transLrcStartPos = 1
            Print("Fetching the lyric of "..currentPlaying.Name)
            http.Fetch("http://api.texl.top/netease/lyric/?id="..CloudMusic.CurrentPlaying.ID, function(body)
                local json = util.JSONToTable(body)
                if not json then
                    AddMessage(GetText("lyricfailed",{"name",currentPlaying.Name}),nil,3000,"error")
                    Print("Failed to fetch the lyric of "..currentPlaying.Name)
                    return
                end
                if json["code"] ~= 200 then
                    AddMessage(GetText("lyricfailed_detail",{"name",currentPlaying.Name},{"msg",json["msg"]}),nil,3000,"error");
                    Print("Failed to fetch the lyric of "..currentPlaying.Name.." because "..json["msg"])
                    return
                end
                if json["lyric"] == nil or json["lyric"] == "" or not json["lyric"]["lrc"] then
                    AddMessage(GetText("nolyric",{"name",currentPlaying.Name}))
                    Print("Song "..currentPlaying.Name.." doesn't have a lyric")
                    return
                end
                if CloudMusic.CurrentPlaying == nil or currentPlaying.ID ~= CloudMusic.CurrentPlaying.ID then return end
                lrc = json["lyric"]["lrc"]
                transLrc = json["lyric"]["tlrc"]
                Print("Fetch lyric successed")
            end, function()AddMessage(GetText("lyricfailed",{"name",currentPlaying.Name}),nil,3000,"error")end)
        end
        local function SongEnded()
            if CloudMusic.NextPlay then
                CloudMusic:Play(CloudMusic.NextPlay)
                CloudMusic.NextPlay = nil
            end
            if GetSettings("CloudMusicPlayMode") == "ListLoop" then
                CloudMusic:Next()
            elseif GetSettings("CloudMusicPlayMode") == "List" then
                local last = false
                for i=1,#CloudMusic.Playlist.Songs do
                    local song = CloudMusic.Playlist.Songs[i]
                    if song.ID == CloudMusic.CurrentPlaying.ID then
                        if i == #CloudMusic.Playlist.Songs then
                            last = true
                        end
                        break
                    end
                end
                if not last then
                    CloudMusic:Next()
                end
            elseif GetSettings("CloudMusicPlayMode") == "Random" then
                CloudMusic:Play(math.random(1, #CloudMusic.Playlist.Songs))
            elseif GetSettings("CloudMusicPlayMode") == "SingleLoop" then
                lrcStartPos = 1
                transLrcStartPos = 1
                CloudMusic.CurrentChannel:Play()
            end
            hook.Run("CloudMusicSongEnded")
        end
        local function SongPlayError()
            if CloudMusic.CurrentPlaying == nil then return end
            AddMessage(GetText("playerror",{"name",CloudMusic.CurrentPlaying.Name}),nil,3000,"error")
            if errorCount == 5 then
                AddMessage(GetText("continue_error"))
                Print("Play error count reached 5, stop trying")
                errorCount = 0
                return
            end
            errorCount = errorCount + 1
            if GetSettings("CloudMusicPlayMode") == "ListLoop" then
                CloudMusic:Next()
            elseif GetSettings("CloudMusicPlayMode") == "List" then
                local last = false
                for i=1,#CloudMusic.Playlist.Songs do
                    local song = CloudMusic.Playlist.Songs[i]
                    if song.ID == CloudMusic.CurrentPlaying.ID then
                        if i == #CloudMusic.Playlist.Songs then
                            last = true
                        end
                        break
                    end
                end
                if not last then
                    CloudMusic:Next()
                end
            elseif GetSettings("CloudMusicPlayMode") == "Random" then
                CloudMusic:Play(math.random(1, #CloudMusic.Playlist.Songs))
            elseif GetSettings("CloudMusicPlayMode") == "SingleLoop" then
                AddMessage(GetText("playerror_loop",{"name",CloudMusic.CurrentPlaying.Name}))
                CloudMusic:Next()
            end
        end
        local function SendSyncData()
            if not GetSettings("CloudMusic3D") then return end
            net.Start("CloudMusic3DSync")
            net.WriteBool(IsValid(CloudMusic.CurrentChannel))
            net.WriteInt(IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetState() or -1,32)
            net.WriteFloat(CloudMusic.Volume)
            net.WriteString(CloudMusic.CurrentPlaying and CloudMusic.CurrentPlaying.ID or "")
            net.WriteFloat(IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetTime() or 0)
            net.SendToServer()
        end
        local fu
        local function SendInfoData()
            local state = IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetState() or -1
            net.Start("CloudMusicInfo")
            net.WriteInt((GetSettings("CloudMusicPublicInfo") and IsValid(CloudMusic.CurrentChannel)) and ((state == GMOD_CHANNEL_PLAYING or GMOD_CHANNEL_STALLED) and CM_STATUS_PLAYING or CM_STATUS_PAUSED) or CM_STATUS_NON_INFO,32)
            net.WriteString(CloudMusic.CurrentPlaying == nil and "" or CloudMusic.CurrentPlaying.Name)
            net.WriteString(CloudMusic.CurrentPlaying == nil and "" or CloudMusic.CurrentPlaying.Artist)
            net.WriteString(CloudMusic.CurrentPlaying == nil and "" or CloudMusic.CurrentPlaying.Album)
            net.WriteString(CloudMusic.CurrentPlaying == nil and "" or CloudMusic.CurrentPlaying.Thumbnail)
            net.SendToServer()
        end
        local function TokenRequest(url,callback,fail,finally,method,data)
            if method == nil then method = "GET" end
            local headers = GetSettings("CloudMusicUserToken") == "" and {} or {
                ["Cookie"] = "MUSIC_U="..GetSettings("CloudMusicUserToken")
            }
            if method == "GET" then
                http.Fetch(url,function(body)
                    if type(callback) == "function" then
                        callback(body)
                    end
                    if type(finally) == "function" then
                        finally()
                    end
                end,function()
                    if type(fail) == "function" then
                        fail()
                    end
                    if type(finally) == "function" then
                        finally()
                    end
                end,headers)
            elseif method == "POST" then
                http.Post(url,data,function(body)
                    if type(callback) == "function" then
                        callback(body)
                    end
                    if type(finally) == "function" then
                        finally()
                    end
                end,function()
                    if type(fail) == "function" then
                        fail()
                    end
                    if type(finally) == "function" then
                        finally()
                    end
                end,headers)
            else
                if type(fail) == "function" then
                    fail()
                end
                if type(finally) == "function" then
                    finally()
                end
            end
        end
        local function GetSongURL(id,callback,finally,share)
            if GetSettings("CloudMusicUseServer") then
                TokenRequest("https://cm.luotianyi.me/api/song/url?id="..id..(share == nil and "" or "&share="..share),function(body)
                    local result = util.JSONToTable(body)
                    if not result or not result["data"] or not result["data"][1] or not result["data"][1]["url"] then
                        if type(callback) == "function" then
                            callback("https://music.163.com/song/media/outer/url?id="..id..".mp3")
                        end
                        if type(finally) == "function" then
                            finally()
                        end
                        return
                    end
                    if type(callback) == "function" then
                        callback(result["data"][1]["url"])
                    end
                    if type(finally) == "function" then
                        finally()
                    end
                end,function()
                    if type(callback) == "function" then
                        callback("https://music.163.com/song/media/outer/url?id="..id..".mp3")
                    end
                    if type(finally) == "function" then
                        finally()
                    end
                end)
            else
                if type(callback) == "function" then
                    callback("https://music.163.com/song/media/outer/url?id="..id..".mp3")
                end
                if type(finally) == "function" then
                    finally()
                end
            end
        end
        local function Create3DChannel(id,ply)
            if IsValid(ply) and not ply.ChannelCreating then
                ply.ChannelCreating = true
                GetSongURL(id,function(url)
                    sound.PlayURL(url,"noblock 3d",function(station)
                        if IsValid(station) and IsValid(ply) then
                            table.insert(channelPlayers, ply)
                            ply.CM_MusicChannel = station
                            ply.CM_MusicChannelID = id
                            net.Start("CloudMusicReqSync")
                            net.SendToServer()
                        end
                        ply.ChannelCreating = false
                    end)
                end,nil,ply:SteamID64())
            end
        end
        local function DisableListHeader(list)
            for _,v in pairs(list.Columns) do
                v.DoClick = function() end
            end
        end
        local function tableEqual(a, b)
            if not a or not b then return false end
            if #a ~= #b then
                return false
            end
            for i = 1, #a do
                if a[i] ~= b[i] then
                    return false
                end
            end
            return true
        end
        local function SetUISkin(panel)
            panel:SetSkin("CloudMusicDermaSkin")
            if panel:GetFont() == "DermaDefault" then
                panel:SetFontInternal("CloudMusicDermaText")
                if panel.SetFont then
                    panel:SetFont("CloudMusicDermaText")
                end
            end
            if panel.GetColor and not tableEqual(panel:GetColor(),GetSettings("CloudMusicTextColor")) and panel.SetColor then
                panel:SetColor(GetSettings("CloudMusicTextColor"))
            end
            if panel.GetTextColor and not tableEqual(panel:GetTextColor(),GetSettings("CloudMusicTextColor")) and panel.SetTextColor then
                if panel:GetClassName() == "DTextEntry" then
                    panel:SetTextColor(GetSettings("CloudMusicTextEntryColor"))
                else
                    panel:SetTextColor(GetSettings("CloudMusicTextColor"))
                end
            end
            for _,v in pairs(panel:GetChildren()) do
                SetUISkin(v)
            end
        end
        local function SetDMUISkin(panel)
            panel:SetSkin("CloudMusicDermaSkin")
            if panel:GetFont() == "DermaDefault" then
                panel:SetFontInternal("CloudMusicDermaText")
                if panel.SetFont then
                    panel:SetFont("CloudMusicDermaText")
                end
            end
            if panel.SetColor then
                panel:SetColor(Color(0,0,0))
            end
            for _,v in pairs(panel:GetChildren()) do
                SetDMUISkin(v)
            end
        end
        local function ShowOverlay()
            if IsValid(CloudMusic.Overlay) and CloudMusic.Overlay.Remove then
                CloudMusic.Overlay:Remove()
            end
            CloudMusic.Overlay = vgui.Create("DPanel",CloudMusic)
            if GetSettings("CloudMusicAnimation") then
                CloudMusic.Overlay:SetAlpha(1)
            else
                CloudMusic.Overlay:SetAlpha(76.5)
            end
            function CloudMusic.Overlay:Paint(w,h)
                draw.RoundedBox(8, 0, 0, w, h, Color(0,0,0,self:GetAlpha()))
            end
            function CloudMusic.Overlay:Think()
                if GetSettings("CloudMusicAnimation") then
                    if not self.IsHiding and self:GetAlpha() < 76.5 then
                        self:SetAlpha(self:GetAlpha()+76.5/10)
                    elseif self.IsHiding then
                        if self:GetAlpha() <= 0 then
                            self:Remove()
                        else
                            self:SetAlpha(self:GetAlpha()-76.5/10)
                        end
                    end
                end
            end
            CloudMusic.Overlay:SetPos(0,0)
            CloudMusic.Overlay:SetSize(winw,winh)
        end
        local function HideOverlay()
            if GetSettings("CloudMusicAnimation") then
                CloudMusic.Overlay.IsHiding = true
            else
                CloudMusic.Overlay:Remove()
            end
        end
        local function InitUserInfo()
            CloudMusic.Login:SetVisible(false)
            CloudMusic.Logout:SetVisible(false)
            CloudMusic.UserInfo:SetVisible(false)
            CloudMusic.User:SetVisible(false)
            CloudMusic.ShowRecommend:SetVisible(false)
            CloudMusic.ShowUserPlaylists:SetVisible(false)
            CloudMusic.User:RemoveI18N()
            if GetSettings("CloudMusicUserToken") == "" then
                Print("No user token, using default layout")
                CloudMusic.Login:SetVisible(true)
            else
                Print("User token detected, try to fetch user info")
                TokenRequest("https://cm.luotianyi.me/api/login/status?u="..LocalPlayer():SteamID64().."&t="..os.time(),function(body)
                    userDetail = util.JSONToTable(body)
                    if userDetail == nil or (userDetail["code"] ~= 200 and userDetail["code"] ~= 301) then
                        AddMessage(GetText("userinfofailed"),nil,3000,"error")
                        CloudMusic.Login:SetVisible(true)
                        Print("Failed to fetch user info, using default layout")
                        return
                    elseif userDetail["code"] == 301 then
                        CloudMusic.Login:SetVisible(true)
                        Print("User login token is invalid, using default layout and clearing user token")
                        SetSettings("CloudMusicUserToken","")
                        return
                    end
                    userDetail = userDetail["profile"]
                    if table.IsEmpty(userDetail) then
                        AddMessage(GetText("userinfofailed"),nil,3000,"error")
                        CloudMusic.Login:SetVisible(true)
                        Print("Failed to fetch user info, using default layout")
                        return
                    end
                    Print("User is logged in, using logged in layout")
                    CloudMusic.Logout:SetVisible(true)
                    CloudMusic.UserInfo:SetVisible(true)
                    CloudMusic.ShowRecommend:SetVisible(true)
                    CloudMusic.ShowUserPlaylists:SetVisible(true)
                    function CloudMusic.User:SetText(str)
                        if self.last ~= str then
                            self:ReloadProfile()
                        end
                        self.last = str
                    end
                    function CloudMusic.User:ReloadProfile()
                        self:SetHTML([[
                            <html>
                                <head>
                                    <style>
                                        * {
                                            cursor:normal;
                                        }
                                        body {
                                            color:white;
                                            font-family:微软雅黑,黑体;
                                            margin:0;
                                            width:100px;
                                            height:30px;
                                            overflow:hidden;
                                            text-align:right;
                                        }
                                        .user-info {
                                            position:absolute;
                                            height:30px;
                                            top:0;
                                            left:0;
                                            right:35px;
                                            text-align:right;
                                            display:inline-block;
                                        }
                                        .user-info .welcome {
                                            position:absolute;
                                            right:0;
                                            top:-2px;
                                            font-size:10px;
                                        }
                                        .user-info .username {
                                            position:absolute;
                                            bottom:-2px;
                                            right:0;
                                        }
                                        img {
                                            position:absolute;
                                            top:0;
                                            right:0;
                                            width:30px;
                                            height:30px;
                                        }
                                    </style>
                                </head>
                                <body>
                                    <div class="user-info">
                                        <span class="welcome">]]..GetText("welcome")..[[</span>
                                        <span class="username">]]..userDetail["nickname"]..[[</span>
                                    </div>]]..(type(userDetail["avatarUrl"]) == "string" and [[
                                    <img src="]]..userDetail["avatarUrl"]..[["/>
                                    ]] or [[]])..[[
                                </body>
                            </html>
                        ]])
                    end
                    CloudMusic.User:SetI18N("welcome")
                    CloudMusic.User:SetVisible(true)
                    hook.Run("CloudMusicUserInfo",userDetail)
                end,function()
                    AddMessage(GetText("userinfofailed"),nil,3000,"error")
                    CloudMusic.Login:SetVisible(true)
                    Print("Failed to fetch user info, using default layout")
                end)
            end
        end
        local function ButtonPaint(self,w,h)
            draw.RoundedBox(3, 0, 0, w, h, (input.IsMouseDown(MOUSE_LEFT) and self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonActivateColor") or ((self:IsHovered() and not self:GetDisabled()) and GetSettings("CloudMusicButtonHoverColor") or GetSettings("CloudMusicButtonColor")))
        end
        local function SetTopFormsDisabled(disabled)
            CloudMusic.SonglistForm.Input:SetDisabled(disabled)
            CloudMusic.SonglistForm.Fetch:SetDisabled(disabled)
            CloudMusic.SearchForm.Input:SetDisabled(disabled)
            CloudMusic.SearchForm.Search:SetDisabled(disabled)
            CloudMusic.ShowUserPlaylists:SetDisabled(disabled)
            CloudMusic.ShowRecommend:SetDisabled(disabled)
        end
        local function HttpGet(url,success,fail,headers,finally)
            if headers == nil then headers = {} end
            http.Fetch(url, function(body,size,headers,code)
                success(body,size,headers,code)
                finally()
            end,function(error)
                fail(error)
                finally()
            end, headers)
        end
        local function HttpPost(url,parameters,success,fail,headers,finally)
            if headers == nil then headers = {} end
            http.Post(url, parameters, function(body,size,headers,code)
                success(body,size,headers,code)
                finally()
            end,function(error)
                fail(error)
                finally()
            end, headers)
        end
        local function BodyMousePos()
            local x,y,wx,wy = gui.MouseX(),gui.MouseY(),CloudMusic:GetPos()
            x = x - wx
            y = y - wy - 30
            return x,y
        end
        local OldSetClipboardText = OldSetClipboardText or SetClipboardText
        local SetClipboardText = function(...)
            OldSetClipboardText(...)
            SetDMUISkin(Derma_Message(GetText("clipboard_msg"), GetText("clipboard_title"), GetText("ok")))
        end
        CloudMusic = vgui.Create("DFrame")
        CloudMusic:ShowCloseButton(false)
        CloudMusic:SetTitle("")
        function CloudMusic:Toggle()
            if self:IsVisible() then
                targetOpacity = 0
                if not GetSettings("CloudMusicAnimation") then
                    self:SetAlpha(0)
                    self:SetVisible(false)
                end
            else
                self.Settings.Playerlist:SyncBlacklist()
                self.Playlist:Sync()
                self:MakePopup()
                self:SetVisible(true)
                targetOpacity = 255
                if GetSettings("CloudMusicAnimation") then
                    self:SetAlpha(1)
                else
                    self:SetAlpha(255)
                end
            end
        end
        function CloudMusic:GetVersion()
            return CLOUDMUSIC_VER
        end
        function CloudMusic:Paint(w,h)
            draw.RoundedBoxEx(8, 0, 30, winw, winh-30, GetSettings("CloudMusicBackgroundColor"), false, false, true, true)
            draw.RoundedBoxEx(8, 0, 0, winw, 30, GetSettings("CloudMusicTitleBarColor"), true, true)
            draw.DrawText(GetText("title"), "CloudMusicTitle", 5, 3, GetSettings("CloudMusicTitleBarTextColor"))
            if GetConVar("cloudmusic_ui_debug") ~= nil and GetConVar("cloudmusic_ui_debug"):GetInt() == 1 then
                local x,y = BodyMousePos()
                draw.DrawText(x..","..y, "DermaDefault", winw/2, 0, Color(0,0,0,255), TEXT_ALIGN_CENTER)
            end
            if msg ~= "" then
                surface.SetFont("CloudMusicTitle")
                draw.DrawText(msg, "CloudMusicText", surface.GetTextSize(GetText("title"))+5, 13, GetSettings("CloudMusicTitleBarTextColor"))
            end
            hook.Run("CloudMusicPaint", self)
        end
        local dragStartX = 0
        local dragStartY = 0
        function CloudMusic:Think()
            if not input.IsMouseDown(MOUSE_LEFT) and (isDragging or isProgDragging or isVolDragging) then
                if IsValid(self.BodyOverlay) and self.BodyOverlay.Remove then
                    self.BodyOverlay:Remove()
                end
                isDragging = false
                isProgDragging = false
                isVolDragging = false
                SendSyncData()
            end
            if GetSettings("CloudMusicAnimation") then
                if self:GetAlpha() == 0 and targetOpacity == 0 then
                    self:SetVisible(false)
                end
                if self:GetAlpha() > targetOpacity then
                    self:SetAlpha(self:GetAlpha()-25.5)
                    if self:GetAlpha() < 0 then
                        self:SetAlpha(0)
                    end
                elseif self:GetAlpha() < targetOpacity then
                    self:SetAlpha(self:GetAlpha()+25.5)
                    if self:GetAlpha() > 255 then
                        self:SetAlpha(255)
                    end
                end
            end
            if isDragging then
                local cx,cy = gui.MouseX(),gui.MouseY()
                local nx,ny = cx-dragStartX,cy-dragStartY
                if nx < 0 then nx = 0 end
                if nx > ScrW()-winw then nx = ScrW()-winw end
                if ny < 0 then ny = 0 end
                if ny > ScrH()-winh then ny = ScrH()-winh end
                self:SetPos(nx,ny)
            end
        end
        function CloudMusic:OnKeyCodePressed(key)
            if input.IsButtonDown(KEY_LALT) then
                if input.IsButtonDown(KEY_DOWN) then
                    self:Toggle()
                end
            end
        end
        function CloudMusic:OnMousePressed(key)
            local x,y = self:LocalCursorPos()
            if key == MOUSE_LEFT and y <= 30 then
                isDragging = true
                dragStartX = x
                dragStartY = y
                if IsValid(self.BodyOverlay) and self.BodyOverlay.Remove then
                    self.BodyOverlay:Remove()
                end
                self.BodyOverlay = vgui.Create("DPanel",self)
                self.BodyOverlay:SetPaintBackground(false)
                self.BodyOverlay:Dock(FILL)
                self.BodyOverlay:SetZPos(2)
            end
        end
        function CloudMusic:OnMouseReleased(key)
            isDragging = false
            if IsValid(self.BodyOverlay) and self.BodyOverlay.Remove then
                self.BodyOverlay:Remove()
            end
        end
        CloudMusic:SetSize(winw, winh)
        CloudMusic:SetPos(ScrW()/2-winw/2,ScrH()/2-winh/2)
        CloudMusic.Close = vgui.Create("DButton",CloudMusic)
        CloudMusic.Close:SetSize(24,24)
        CloudMusic.Close:SetPos(winw-27,3)
        CloudMusic.Close:SetColor(Color(255,255,255))
        CloudMusic.Close:SetText("X")
        CloudMusic.Close:SetDrawBackground(false)
        function CloudMusic.Close:DoClick()CloudMusic:Toggle()end
        function CloudMusic.Close:Paint(w,h)
            if self:IsHovered() then
                draw.RoundedBox(12, 0, 0, w, h, Color(255,0,0))
                self:SetColor(Color(255,255,255))
            else
                self:SetColor(GetSettings("CloudMusicTitleBarTextColor"))
            end
        end
        CloudMusic.Login = vgui.Create("DButton",CloudMusic)
        function CloudMusic.Login:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(winw-self:GetWide()-27,30/2-20/2)
        end
        CloudMusic.Login:SetI18N("login")
        CloudMusic.Login.Paint = ButtonPaint
        function CloudMusic.Login:DoClick()
            ShowOverlay()
            CloudMusic.LoginPrompt = vgui.Create("DPanel",CloudMusic)
            CloudMusic.LoginPrompt:SetZPos(2)
            CloudMusic.LoginPrompt:SetPos(winw/2-350/2,(winh-30)/2-400/2+30)
            CloudMusic.LoginPrompt:SetSize(350,400)
            function CloudMusic.LoginPrompt:Think()
                if self.Mode == "Email" then
                    self.Username:SetPos(10,75)
                    self.Username:SetSize(350-20,20)
                elseif self.Mode == "Phone" then
                    self.Username:SetPos(35,75)
                    self.Username:SetSize(350-45,20)
                end
            end
            CloudMusic.LoginPrompt.Title = vgui.Create("DLabel",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Title:SetI18N("login_title")
            CloudMusic.LoginPrompt.Title:SetFont("CloudMusicTitle")
            CloudMusic.LoginPrompt.Title:SetColor(Color(0,0,0))
            CloudMusic.LoginPrompt.Title:SetContentAlignment(5)
            CloudMusic.LoginPrompt.Title:SetPos(0,0)
            CloudMusic.LoginPrompt.Title:SetSize(350,50)
            CloudMusic.LoginPrompt.Mode = "Email"
            CloudMusic.LoginPrompt.ToggleMode = vgui.Create("DButton",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.ToggleMode:SetPos(10,50)
            CloudMusic.LoginPrompt.ToggleMode:SetSize(350-20,20)
            function CloudMusic.LoginPrompt.ToggleMode:Think()
                if CloudMusic.LoginPrompt.Mode == "Email" then
                    self:SetI18N("use_phone")
                elseif CloudMusic.LoginPrompt.Mode == "Phone" then
                    self:SetI18N("use_email")
                end
            end
            function CloudMusic.LoginPrompt.ToggleMode:DoClick()
                if CloudMusic.LoginPrompt.Mode == "Email" then
                    CloudMusic.LoginPrompt.Mode = "Phone"
                else
                    CloudMusic.LoginPrompt.Mode = "Email"
                end
                CloudMusic.LoginPrompt.Username:SetValue("")
            end
            CloudMusic.LoginPrompt.PhoneAreaNum = vgui.Create("DTextEntry",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.PhoneAreaNum:SetPos(10,75)
            CloudMusic.LoginPrompt.PhoneAreaNum:SetSize(20,20)
            CloudMusic.LoginPrompt.PhoneAreaNum:SetValue(86)
            CloudMusic.LoginPrompt.PhoneAreaNum:SetNumeric(true)
            CloudMusic.LoginPrompt.Username = vgui.Create("DTextEntry",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Username:SetPos(10,75)
            CloudMusic.LoginPrompt.Username:SetSize(350-20,20)
            function CloudMusic.LoginPrompt.Username:Think()
                if CloudMusic.LoginPrompt.Mode == "Email" then
                    self:SetI18N("email",I18N_PLACEHOLDER)
                elseif CloudMusic.LoginPrompt.Mode == "Phone" then
                    self:SetI18N("phone",I18N_PLACEHOLDER)
                end
            end
            CloudMusic.LoginPrompt.Password = vgui.Create("DTextEntry",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Password:SetPos(10,100)
            CloudMusic.LoginPrompt.Password:SetSize(350-20,20)
            CloudMusic.LoginPrompt.Password:SetI18N("password",I18N_PLACEHOLDER)
            CloudMusic.LoginPrompt.Privacy = vgui.Create("DPanel", CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Privacy:SetPos(10,125)
            CloudMusic.LoginPrompt.Privacy:SetSize(350-20,20)
            CloudMusic.LoginPrompt.Privacy.Select = vgui.Create("DCheckBox", CloudMusic.LoginPrompt.Privacy)
            CloudMusic.LoginPrompt.Privacy.Text = vgui.Create("DLabel", CloudMusic.LoginPrompt.Privacy)
            CloudMusic.LoginPrompt.Privacy.Text:SetPos(20,0)
            function CloudMusic.LoginPrompt.Privacy.Text:LangUpdate()
                self:SizeToContents()
            end
            CloudMusic.LoginPrompt.Privacy.Text:SetI18N("read_agreed")
            CloudMusic.LoginPrompt.Privacy.Link = vgui.Create("DLabelURL", CloudMusic.LoginPrompt.Privacy)
            function CloudMusic.LoginPrompt.Privacy.Link:LangUpdate()
                self:SizeToContents()
                self:SetPos(20+CloudMusic.LoginPrompt.Privacy.Text:GetWide(),0)
            end
            CloudMusic.LoginPrompt.Privacy.Link:SetI18N("privacy_policy")
            CloudMusic.LoginPrompt.Privacy.Link:SizeToContents()
            CloudMusic.LoginPrompt.Privacy.Link:SetColor(Color(6,72,255))
            CloudMusic.LoginPrompt.Privacy.Link:SetURL("https://forum.m4tec.org/d/5-cloudmusic-for-garry-s-mod")
            CloudMusic.LoginPrompt.Login = vgui.Create("DButton",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Login:SetPos(10,145)
            CloudMusic.LoginPrompt.Login:SetSize(350-20,20)
            CloudMusic.LoginPrompt.Login:SetI18N("login")
            function CloudMusic.LoginPrompt.Login:DoClick()
                if not CloudMusic.LoginPrompt.Privacy.Select:GetChecked() then
                    SetDMUISkin(Derma_Message(GetText("privacy_policy_warn"),GetText("warning"),GetText("ok")))
                    return
                end
                CloudMusic.LoginPrompt.PhoneAreaNum:SetDisabled(true)
                CloudMusic.LoginPrompt.Username:SetDisabled(true)
                CloudMusic.LoginPrompt.Password:SetDisabled(true)
                CloudMusic.LoginPrompt.Privacy.Select:SetDisabled(true)
                self:SetDisabled(true)
                Print("Logging in...")
                if CloudMusic.LoginPrompt.Mode == "Email" then
                    TokenRequest("https://cm.luotianyi.me/api/login?email="..CloudMusic.LoginPrompt.Username:GetValue():JavascriptSafe().."&password="..CloudMusic.LoginPrompt.Password:GetValue():JavascriptSafe().."&u="..LocalPlayer():SteamID64(),function(body)
                        local result = util.JSONToTable(body)
                        if not result or (result["code"] ~= 200 and not result["msg"]) then
                            SetDMUISkin(Derma_Message(GetText("loginfailed"), GetText("error"), GetText("ok")))
                            return
                        end
                        if result["code"] ~= 200 then
                            SetDMUISkin(Derma_Message(GetText("loginfailed").."\n"..result["msg"], GetText("error"), GetText("ok")))
                            return
                        end
                        SetSettings("CloudMusicUserToken",result["token"])
                        SetDMUISkin(Derma_Message(GetText("loginsuccess",{"name",result["profile"]["nickname"]}), GetText("welcome"), GetText("ok")))
                        InitUserInfo()
                        HideOverlay()
                        Print("User logged in")
                        CloudMusic.LoginPrompt:Remove()
                    end,function()
                        SetDMUISkin(Derma_Message(GetText("loginfailed"), GetText("error"), GetText("ok")))
                        Print("Login failed")
                    end,function()
                        CloudMusic.LoginPrompt.PhoneAreaNum:SetDisabled(false)
                        CloudMusic.LoginPrompt.Username:SetDisabled(false)
                        CloudMusic.LoginPrompt.Password:SetDisabled(false)
                        CloudMusic.LoginPrompt.Privacy.Select:SetDisabled(false)
                        self:SetDisabled(false)
                    end)
                else
                    TokenRequest("https://cm.luotianyi.me/api/login/cellphone?phone="..CloudMusic.LoginPrompt.Username:GetValue():JavascriptSafe().."&password="..CloudMusic.LoginPrompt.Password:GetValue():JavascriptSafe().."&countrycode="..CloudMusic.LoginPrompt.PhoneAreaNum:GetValue().."&u="..LocalPlayer():SteamID64(),function(body)
                        local result = util.JSONToTable(body)
                        if result == nil then
                            SetDMUISkin(Derma_Message(GetText("loginfailed"), GetText("error"), GetText("ok")))
                            return
                        end
                        if result["code"] ~= 200 then
                            SetDMUISkin(Derma_Message(GetText("loginfailed").."\n"..result["msg"], GetText("error"), GetText("ok")))
                            return
                        end
                        SetSettings("CloudMusicUserToken",result["token"])
                        SetDMUISkin(Derma_Message(GetText("loginsuccess",{"name",result["profile"]["nickname"]}), GetText("welcome"), GetText("ok")))
                        InitUserInfo()
                        HideOverlay()
                        Print("User logged in")
                        CloudMusic.LoginPrompt:Remove()
                    end,function()
                        SetDMUISkin(Derma_Message(GetText("loginfailed"), GetText("error"), GetText("ok")))
                        Print("Login failed")
                    end,function()
                        CloudMusic.LoginPrompt.PhoneAreaNum:SetDisabled(false)
                        CloudMusic.LoginPrompt.Username:SetDisabled(false)
                        CloudMusic.LoginPrompt.Password:SetDisabled(false)
                        CloudMusic.LoginPrompt.Privacy.Select:SetDisabled(false)
                        self:SetDisabled(false)
                    end)
                end
            end
            CloudMusic.LoginPrompt.Cancel = vgui.Create("DButton",CloudMusic.LoginPrompt)
            CloudMusic.LoginPrompt.Cancel:SetPos(10,400-30)
            CloudMusic.LoginPrompt.Cancel:SetSize(350-20,20)
            CloudMusic.LoginPrompt.Cancel:SetI18N("cancel")
            function CloudMusic.LoginPrompt.Cancel:DoClick()
                CloudMusic.LoginPrompt:Remove()
                HideOverlay()
            end
            SetUISkin(CloudMusic.LoginPrompt)
        end
        CloudMusic.Logout = vgui.Create("DButton",CloudMusic)
        function CloudMusic.Logout:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(winw-self:GetWide()-32,30/2-20/2)
        end
        CloudMusic.Logout:SetI18N("logout")
        CloudMusic.Logout.Paint = ButtonPaint
        function CloudMusic.Logout:DoClick()
            TokenRequest("https://cm.luotianyi.me/api/logout?uid="..LocalPlayer():SteamID64(),function(body)
                SetSettings("CloudMusicUserToken","")
                InitUserInfo()
                SetDMUISkin(Derma_Message(GetText("logoutsuccess"),GetText("success"),GetText("ok")))
                Print("User logged out")
            end,function()
                SetDMUISkin(Derma_Message(GetText("logoutfailed"),GetText("error"),GetText("ok")))
                Print("Failed to log out")
            end)
        end
        CloudMusic.UserInfo = vgui.Create("DButton",CloudMusic)
        function CloudMusic.UserInfo:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+10,20)
            self:SetPos(winw-self:GetWide()-CloudMusic.Logout:GetWide()-37,30/2-20/2)
        end
        CloudMusic.UserInfo:SetI18N("profile")
        CloudMusic.UserInfo.Paint = ButtonPaint
        function CloudMusic.UserInfo:DoClick()
            ShowOverlay()
            CloudMusic.UInfo = vgui.Create("DPanel",CloudMusic)
            CloudMusic.UInfo:SetZPos(2)
            CloudMusic.UInfo:SetPos(winw/2-winw/4,(winh-30)/2-300/2+30)
            CloudMusic.UInfo:SetSize(winw/2,300)
            CloudMusic.UInfo.Avatar = vgui.Create("DHTML", CloudMusic.UInfo)
            CloudMusic.UInfo.Avatar:SetPos(5,5)
            CloudMusic.UInfo.Avatar:SetSize(64,64)
            CloudMusic.UInfo.Avatar:SetHTML([[
                <html>
                    <body style="overflow:hidden;margin:0;">
                        <img style="width:64px;height:64px;" src="]]..(type(userDetail["avatarUrl"]) == "string" and userDetail["avatarUrl"] or "")..[[" title="]]..userDetail["nickname"]..[["/>
                    </body>
                </html>
            ]])
            CloudMusic.UInfo.Username = vgui.Create("DLabel", CloudMusic.UInfo)
            CloudMusic.UInfo.Username:SetPos(74,5)
            CloudMusic.UInfo.Username:SetFont("CloudMusicTitle")
            CloudMusic.UInfo.Username.I18NParams = {
                ["name"] = userDetail["nickname"]
            }
            CloudMusic.UInfo.Username:SetI18N("greeting")
            CloudMusic.UInfo.Username:SizeToContents()
            CloudMusic.UInfo.Details = vgui.Create("DTextEntry", CloudMusic.UInfo)
            CloudMusic.UInfo.Details:SetEditable(false)
            CloudMusic.UInfo.Details:SetPos(5,74)
            CloudMusic.UInfo.Details:SetSize(winw/2-10,300-74-55)
            CloudMusic.UInfo.Details:SetI18N("wait",I18N_VALUE)
            CloudMusic.UInfo.Details:SetMultiline(true)
            CloudMusic.UInfo.Signin = vgui.Create("DButton",CloudMusic.UInfo)
            CloudMusic.UInfo.Signin:SetPos(5,300-50)
            CloudMusic.UInfo.Signin:SetSize(winw/2-10,20)
            CloudMusic.UInfo.Signin:SetI18N("signin")
            function CloudMusic.UInfo.Signin:DoClick()
                self:SetDisabled(true)
                Print("Signing in with Netease Android client")
                TokenRequest("https://cm.luotianyi.me/api/daily_signin?t="..os.time(),function(body)
                    local json = util.JSONToTable(body)
                    if json["code"] == 200 then
                        SetDMUISkin(Derma_Message(GetText("signinsuccess",{"point",json["point"]}), GetText("signin"), GetText("ok")))
                    else
                        SetDMUISkin(Derma_Message(json["msg"], GetText("signin"), GetText("ok")))
                    end
                    Print("Sign in successed")
                end,function()
                    SetDMUISkin(Derma_Message(GetText("signinfailed"), GetText("signin"), GetText("ok")))
                    Print("Failed to sign in")
                end,function()
                    self:SetDisabled(false)
                end)
            end
            CloudMusic.UInfo.Close = vgui.Create("DButton",CloudMusic.UInfo)
            CloudMusic.UInfo.Close:SetPos(5,300-25)
            CloudMusic.UInfo.Close:SetSize(winw/2-10,20)
            CloudMusic.UInfo.Close:SetI18N("close")
            function CloudMusic.UInfo.Close:DoClick()
                CloudMusic.UInfo:Remove()
                HideOverlay()
            end
            Print("Fetching user details")
            TokenRequest("https://cm.luotianyi.me/api/user/subcount?u="..LocalPlayer():SteamID64(),function(body)
                local json = util.JSONToTable(body)
                if not json then
                    CloudMusic.UInfo.Details:SetI18N("fetch_failed",I18N_VALUE)
                    return
                end
                if json["code"] == 200 and IsValid(CloudMusic.UInfo) then
                    Print("Fetch user details successed")
                    CloudMusic.UInfo.Details.I18NParams = {
                        ["djRadioCount"] = json["djRadioCount"],
                        ["mvCount"] = json["mvCount"],
                        ["artistCount"] = json["artistCount"],
                        ["createDjRadioCount"] = json["createDjRadioCount"],
                        ["createdPlaylistCount"] = json["createdPlaylistCount"],
                        ["subPlaylistCount"] = json["subPlaylistCount"]
                    }
                    CloudMusic.UInfo.Details:SetI18N("user_details",I18N_VALUE)
                end
            end)
            SetUISkin(CloudMusic.UInfo)
        end
        CloudMusic.User = vgui.Create("DHTML",CloudMusic)
        CloudMusic.User:SetSize(winw*0.4,30)
        function CloudMusic.User:LangUpdate()
            self:SetPos(CloudMusic.UserInfo:GetPos()-self:GetWide()-5,0)
        end
        CloudMusic.User:SetMouseInputEnabled(false)
        CloudMusic.Body = vgui.Create("DPanel",CloudMusic)
        CloudMusic.Body:SetPos(0,30)
        CloudMusic.Body:SetSize(winw,winh-30)
        function CloudMusic.Body:Paint(w,h)
            draw.DrawText("Made by Texas", "CloudMusicText", winw-5, 0, Color(202,202,202), TEXT_ALIGN_RIGHT)
        end
        function CloudMusic.Body:Think()
            if currentShowingPage == "Settings" and (self:GetPos()) > -winw then
                if GetSettings("CloudMusicAnimation") then
                    self:SetPos((self:GetPos()-slideAnimPix),30)
                else
                    self:SetPos(-winw,30)
                end
            elseif currentShowingPage == "Main" and (self:GetPos()) ~= 0 then
                if GetSettings("CloudMusicAnimation") then
                    self:SetPos((self:GetPos()+slideAnimPix),30)
                    if (self:GetPos()) > 0 then self:SetPos(0,30) end
                else
                    self:SetPos(0,30)
                end
            end
        end
        CloudMusic.SettingsButton = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.SettingsButton:SetColor(Color(255,255,255))
        function CloudMusic.SettingsButton:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(winw-self:GetWide()-5,19)
        end
        CloudMusic.SettingsButton:SetI18N("settings")
        CloudMusic.SettingsButton.DoClick = function()currentShowingPage = "Settings"CloudMusic.Settings.Playerlist:SyncBlacklist()end
        CloudMusic.SettingsButton.Paint = ButtonPaint
        CloudMusic.SonglistForm = vgui.Create("DPanel",CloudMusic.Body)
        CloudMusic.SonglistForm:SetHeight(34)
        CloudMusic.SonglistForm:SetPos(5,5)
        CloudMusic.SonglistForm:SetDrawBackground(false)
        function CloudMusic.SonglistForm:Paint(w,h)
            draw.DrawText(GetText("playlist_id"),"CloudMusicText",0,0,GetSettings("CloudMusicTextColor"))
        end
        CloudMusic.SonglistForm.Input = vgui.Create("DTextEntry",CloudMusic.SonglistForm)
        CloudMusic.SonglistForm.Input:SetPos(0,14)
        CloudMusic.SonglistForm.Input:SetNumeric(true)
        CloudMusic.SonglistForm.Fetch = vgui.Create("DButton",CloudMusic.SonglistForm)
        CloudMusic.SonglistForm.Fetch:SetPos(67,14)
        CloudMusic.SonglistForm.Fetch:SetSize(30,20)
        function CloudMusic.SonglistForm.Fetch:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(CloudMusic.SonglistForm.Input:GetWide()+5,14)
            CloudMusic.SonglistForm:SetWide(self:GetWide()+CloudMusic.SonglistForm.Input:GetWide()+5)
        end
        CloudMusic.SonglistForm.Fetch:SetI18N("fetch")
        CloudMusic.SonglistForm.Fetch.DoClick = function()
            local success,songlist = xpcall(function()return CloudMusic.SonglistForm.Input:GetInt()end,function()end)
            if not success or not songlist then
                SetDMUISkin(Derma_Message(GetText("wrong_playlist_id"), GetText("error"), GetText("ok")))
                return
            end
            SetTopFormsDisabled(true)
            local prev,next = CloudMusic.PrevPage:IsVisible(),CloudMusic.NextPage:IsVisible()
            CloudMusic.PrevPage:SetVisible(false)
            CloudMusic.NextPage:SetVisible(false)
            Print("Fetching playlist")
            HttpGet("https://music.163.com/api/playlist/detail?id="..songlist, function(json)
                local obj = util.JSONToTable(json)
                if obj["code"] ~= 200 then
                    SetDMUISkin(Derma_Message(GetText("fetch_playlist_failed"), GetText("error"), GetText("ok")))
                    CloudMusic.PrevPage:SetVisible(prev)
                    CloudMusic.NextPage:SetVisible(next)
                    return
                end
                CloudMusic.PrevPage:SetVisible(false)
                CloudMusic.NextPage:SetVisible(false)
                CloudMusic.Songlist:Resolve(obj["result"]["tracks"])
                CloudMusic.Songlist:SetVisible(true)
                CloudMusic.Playlists:SetVisible(false)
                Print("Fetch playlist successed")
            end, function()SetDMUISkin(Derma_Message(GetText("fetch_playlist_failed"), GetText("error"), GetText("ok")))end,nil,function()
                SetTopFormsDisabled(false)
            end)
        end
        CloudMusic.SonglistForm.Fetch.Paint = ButtonPaint
        local offset = 0
        local songCount = 0
        local searchWord = ""
        CloudMusic.SearchForm = vgui.Create("DPanel",CloudMusic.Body)
        CloudMusic.SearchForm:SetHeight(34)
        function CloudMusic.SearchForm:Paint(w,h)
            draw.DrawText(GetText("search_song"), "CloudMusicText", 0, 0, GetSettings("CloudMusicTextColor"))
        end
        CloudMusic.SearchForm.Input = vgui.Create("DTextEntry",CloudMusic.SearchForm)
        CloudMusic.SearchForm.Input:SetPos(0,14)
        CloudMusic.SearchForm.Input:SetSize(100,20)
        CloudMusic.SearchForm.Search = vgui.Create("DButton",CloudMusic.SearchForm)
        CloudMusic.SearchForm.Search:SetPos(105,14)
        function CloudMusic.SearchForm.Search:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            CloudMusic.SearchForm:SetPos(CloudMusic.SonglistForm:GetWide()+10,5)
            CloudMusic.SearchForm:SetWide(105+self:GetWide())
        end
        CloudMusic.SearchForm.Search:SetI18N("search")
        CloudMusic.SearchForm.Search.DoClick = function()
            SetTopFormsDisabled(true)
            Print("Searching songs")
            local prev,next = CloudMusic.PrevPage:IsVisible(),CloudMusic.NextPage:IsVisible()
            CloudMusic.PrevPage:SetVisible(false)
            CloudMusic.NextPage:SetVisible(false)
            HttpPost("http://music.163.com/api/search/pc", {
                ["s"] = CloudMusic.SearchForm.Input:GetValue(),
                ["type"] = "1",
                ["limit"] = "100"
            }, function(body)
                local json = util.JSONToTable(body)
                if not json or json["code"] ~= 200 or json["result"]["songs"] == nil then
                    SetDMUISkin(Derma_Message(GetText("search_failed"), GetText("error"), GetText("ok")))
                    CloudMusic.PrevPage:SetVisible(prev)
                    CloudMusic.NextPage:SetVisible(next)
                    return
                end
                TextMessage(GetText("searchresult",{"count",json["result"]["songCount"]}))
                if json["result"]["songCount"] > 100 then
                    CloudMusic.PrevPage:SetDisabled(true)
                    CloudMusic.PrevPage:SetVisible(true)
                    CloudMusic.NextPage:SetVisible(true)
                else
                    CloudMusic.PrevPage:SetVisible(false)
                    CloudMusic.NextPage:SetVisible(false)
                end
                offset = 0
                songCount = json["result"]["songCount"]
                searchWord = CloudMusic.SearchForm.Input:GetValue()
                CloudMusic.Songlist:Resolve(json["result"]["songs"])
                CloudMusic.Songlist:SetVisible(true)
                CloudMusic.Playlists:SetVisible(false)
                Print("Search successed")
            end, function()SetDMUISkin(Derma_Message(GetText("search_failed"), GetText("error"), GetText("ok"))) end,nil,function()
                SetTopFormsDisabled(false)
            end)
        end
        CloudMusic.SearchForm.Search.Paint = ButtonPaint
        CloudMusic.ShowRecommend = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.ShowRecommend:SetColor(Color(255,255,255))
        function CloudMusic.ShowRecommend:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(CloudMusic.SearchForm:GetPos()+CloudMusic.SearchForm:GetWide()+10,19)
        end
        CloudMusic.ShowRecommend:SetI18N("daily_recommend")
        CloudMusic.ShowRecommend.Paint = ButtonPaint
        function CloudMusic.ShowRecommend:DoClick()
            SetTopFormsDisabled(true)
            Print("Fetching user recommend songs")
            local prev,next = CloudMusic.PrevPage:IsVisible(),CloudMusic.NextPage:IsVisible()
            CloudMusic.PrevPage:SetVisible(false)
            CloudMusic.NextPage:SetVisible(false)
            TokenRequest("https://cm.luotianyi.me/api/recommend/songs?uid="..LocalPlayer():SteamID64(),function(body)
                local result = util.JSONToTable(body)
                if not result or result["code"] ~= 200 then
                    SetDMUISkin(Derma_Message(GetText("fetch_daily_recommend_failed"), GetText("error"), GetText("ok")))
                    CloudMusic.PrevPage:SetVisible(prev)
                    CloudMusic.NextPage:SetVisible(next)
                    return
                end
                CloudMusic.Songlist:Resolve(result["recommend"])
                CloudMusic.Songlist:SetVisible(true)
                CloudMusic.Playlists:SetVisible(false)
                Print("Fetch user recommend songs successed")
            end,function()
                SetDMUISkin(Derma_Message(GetText("fetch_daily_recommend_failed"), GetText("error"), GetText("ok")))
            end,function()
                SetTopFormsDisabled(false)
            end)
        end
        CloudMusic.ShowUserPlaylists = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.ShowUserPlaylists:SetPos(315,19)
        CloudMusic.ShowUserPlaylists:SetSize(60,20)
        CloudMusic.ShowUserPlaylists:SetColor(Color(255,255,255))
        function CloudMusic.ShowUserPlaylists:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(CloudMusic.ShowRecommend:GetPos()+CloudMusic.ShowRecommend:GetWide()+5,19)
        end
        CloudMusic.ShowUserPlaylists:SetI18N("my_playlists")
        CloudMusic.ShowUserPlaylists.Paint = ButtonPaint
        function CloudMusic.ShowUserPlaylists:DoClick()
            SetTopFormsDisabled(true)
            Print("Fetching user playlists")
            local prev,next = CloudMusic.PrevPage:IsVisible(),CloudMusic.NextPage:IsVisible()
            CloudMusic.PrevPage:SetVisible(false)
            CloudMusic.NextPage:SetVisible(false)
            TokenRequest("https://cm.luotianyi.me/api/user/playlist?uid="..userDetail["userId"],function(body)
                local result = util.JSONToTable(body)
                if not result or result["code"] ~= 200 then
                    SetDMUISkin(Derma_Message(GetText("fetch_user_playlists_faield"), GetText("error"), GetText("ok")))
                    CloudMusic.PrevPage:SetVisible(prev)
                    CloudMusic.NextPage:SetVisible(next)
                    return
                end
                CloudMusic.Playlists:Resolve(result["playlist"])
                CloudMusic.Songlist:SetVisible(false)
                CloudMusic.Playlists:SetVisible(true)
                Print("Fetch user playlists successed")
            end,function()
                SetDMUISkin(Derma_Message(GetText("fetch_user_playlists_faield"), GetText("error"), GetText("ok")))
            end,function()
                SetTopFormsDisabled(false)
            end)
        end
        CloudMusic.Songlist = vgui.Create("DListView",CloudMusic.Body)
        do
            CloudMusic.Songlist:AddColumn(""):SetI18N("song_name",I18N_COLUMN)
            CloudMusic.Songlist:AddColumn(""):SetI18N("artist",I18N_COLUMN)
            CloudMusic.Songlist:AddColumn(""):SetI18N("album",I18N_COLUMN)
            local id_column = CloudMusic.Songlist:AddColumn("")
            id_column:SetMaxWidth(100)
            id_column:SetI18N("song_id",I18N_COLUMN)
        end
        CloudMusic.Songlist:SetSortable(false)
        CloudMusic.Songlist:SetPos(5,44)
        CloudMusic.Songlist:SetSize(winw-315,winh-149)
        DisableListHeader(CloudMusic.Songlist)
        function CloudMusic.Songlist:DoDoubleClick(id, line)
            CloudMusic.Playlist:AddMusic(CloudMusic.Songs[id])
        end
        function CloudMusic.Songlist:OnRowRightClick(lineID, line)
            self:ShowMenu()
        end
        function CloudMusic.Songlist:Resolve(tracks)
            if tracks == nil then SetDMUISkin(Derma_Message(GetText("empty_playlist_msg"), GetText("empty_playlist"), GetText("ok"))) end
            CloudMusic.Songs = {}
            if #self:GetLines() ~= 0 then
                for i=1,#self:GetLines() do
                    self:RemoveLine(i)
                end
            end
            for i=1,#tracks do
                local track = tracks[i]
                local artist = ""
                for j=1,#track["artists"] do
                    if j ~= 1 then
                        artist = artist .. ", "
                    end
                    artist = artist .. track["artists"][j]["name"]
                end
                self:AddLine(track["name"],artist,track["album"]["name"],track["id"])
                table.insert(CloudMusic.Songs,{
                    Name = track["name"],
                    Artist = artist,
                    Album = track["album"]["name"],
                    ID = track["id"],
                    Thumbnail = track["album"]["picUrl"]
                })
            end
            SetUISkin(self)
        end
        function CloudMusic.Songlist:ShowMenu()
            local menu = DermaMenu(self)
            menu:AddOption(GetText("play"),function()
                CloudMusic:Play(CloudMusic.Songs[self:GetSelectedLine()])
            end):SetIcon("icon16/transmit.png")
            menu:AddOption(GetText("next_play"),function()
                CloudMusic.NextPlay = CloudMusic.Songs[self:GetSelectedLine()]
            end):SetIcon("icon16/transmit_go.png")
            menu:AddOption(GetText("add_to_playlist"),function()
                CloudMusic.Playlist:AddMusic(CloudMusic.Songs[self:GetSelectedLine()])
            end):SetIcon("icon16/add.png")
            menu:AddOption(GetText("copy_songid"),function()
                SetClipboardText(CloudMusic.Songs[self:GetSelectedLine()].ID)
            end):SetIcon("icon16/page_copy.png")
            menu:AddOption(GetText("copy_songurl"),function()
                SetClipboardText("https://music.163.com/song/media/outer/url?id="..CloudMusic.Songs[self:GetSelectedLine()].ID)
            end):SetIcon("icon16/page_white_copy.png")
            menu:AddSpacer()
            menu:AddOption(GetText("add_selected_to_playlist"),function()
                local selectedCount = #self:GetSelected()
                for _=1,selectedCount do
                    CloudMusic.Playlist:AddMusic(CloudMusic.Songs[self:GetSelectedLine()+_-1])
                end
            end):SetIcon("icon16/application_add.png")
            menu:AddOption(GetText("add_list_to_playlist"),function()
                for _,v in pairs(CloudMusic.Songs) do
                    CloudMusic.Playlist:AddMusic(v)
                end
            end):SetIcon("icon16/book_add.png")
            menu:AddSpacer()
            menu:AddOption(GetText("clear_list"),function()
                SetDMUISkin(Derma_Query(GetText("undo_warn"),GetText("clear_song_list_title"),GetText("sure"),function()
                    CloudMusic.Songs = {}
                    if #self:GetLines() ~= 0 then
                        for i=1,#self:GetLines() do
                            self:RemoveLine(i)
                        end
                    end
                end,GetText("cancel")))
            end):SetIcon("icon16/delete.png")
            SetUISkin(menu)
            menu:Open()
        end
        CloudMusic.Playlists = vgui.Create("DListView",CloudMusic.Body)
        do
            CloudMusic.Playlists:AddColumn(""):SetI18N("playlist_name",I18N_COLUMN)
            CloudMusic.Playlists:AddColumn(""):SetI18N("author",I18N_COLUMN)
            CloudMusic.Playlists:AddColumn(""):SetI18N("song_count",I18N_COLUMN)
            local id_column = CloudMusic.Playlists:AddColumn("")
            id_column:SetMaxWidth(100)
            id_column:SetI18N("playlist_id",I18N_COLUMN)
        end
        CloudMusic.Playlists:SetSortable(false)
        CloudMusic.Playlists:SetPos(5,44)
        CloudMusic.Playlists:SetSize(winw-315,winh-149)
        DisableListHeader(CloudMusic.Playlists)
        function CloudMusic.Playlists:DoDoubleClick(id, line)
            http.Fetch("http://music.163.com/api/playlist/detail?id="..line:GetColumnText(4), function(json)
                local obj = util.JSONToTable(json)
                if obj["code"] ~= 200 then
                    SetDMUISkin(Derma_Message(GetText("playlistfailed"), GetText("error"), GetText("ok")))
                    return
                end
                CloudMusic.PrevPage:SetVisible(false)
                CloudMusic.NextPage:SetVisible(false)
                CloudMusic.Songlist:Resolve(obj["result"]["tracks"])
                CloudMusic.Songlist:SetVisible(true)
                self:SetVisible(false)
            end, function()SetDMUISkin(Derma_Message(GetText("playlistfailed"), GetText("error"), GetText("ok")))end)
        end
        function CloudMusic.Playlists:OnRowRightClick(lineID, line)
            self:ShowMenu()
        end
        function CloudMusic.Playlists:Resolve(playlists)
            if #self:GetLines() ~= 0 then
                for i=1,#self:GetLines() do
                    self:RemoveLine(i)
                end
            end
            for _,v in ipairs(playlists) do
                self:AddLine(v["name"],v["creator"]["nickname"],v["trackCount"],v["id"])
            end
            SetUISkin(self)
        end
        function CloudMusic.Playlists:ShowMenu()
            local menu = DermaMenu(self)
            menu:AddOption(GetText("open"),function()
                http.Fetch("http://music.163.com/api/playlist/detail?id="..self:GetSelected()[1]:GetColumnText("4"), function(json)
                    local obj = util.JSONToTable(json)
                    if obj["code"] ~= 200 then
                        SetDMUISkin(Derma_Message(GetText("playlistfailed"), GetText("error"), GetText("ok")))
                        return
                    end
                    CloudMusic.PrevPage:SetVisible(false)
                    CloudMusic.NextPage:SetVisible(false)
                    CloudMusic.Songlist:Resolve(obj["result"]["tracks"])
                    CloudMusic.Songlist:SetVisible(true)
                    self:SetVisible(false)
                end, function()SetDMUISkin(Derma_Message(GetText("playlistfailed"), GetText("error"), GetText("ok")))end)
            end):SetIcon("icon16/transmit.png")
            menu:AddOption(GetText("add_playlist_to_playlist"),function()
                http.Fetch("http://music.163.com/api/playlist/detail?id="..self:GetSelected()[1]:GetColumnText("4"), function(json)
                    local obj = util.JSONToTable(json)
                    if obj["code"] ~= 200 then
                        SetDMUISkin(Derma_Message(GetText("playlistfailed"), GetText("error"), GetText("ok")))
                        return
                    end
                    CloudMusic.PrevPage:SetVisible(false)
                    CloudMusic.NextPage:SetVisible(false)
                    for _,v in ipairs(obj["result"]["tracks"]) do
                        local artist = ""
                        for j=1,#track["artists"] do
                            if j ~= 1 then
                                artist = artist .. ", "
                            end
                            artist = artist .. track["artists"][j]["name"]
                        end
                        CloudMusic.Playlist:AddMusic({
                            Name = track["name"],
                            Artist = artist,
                            Album = track["album"]["name"],
                            ID = track["id"],
                            Thumbnail = track["album"]["picUrl"]
                        })
                    end
                end, function()SetDMUISkin(Derma_Message(GetText("playlistfailed"), GetText("error"), GetText("ok")))end)
            end):SetIcon("icon16/book_add.png")
            menu:AddOption(GetText("copy_playlist_id"),function()
                SetClipboardText(self:GetSelected()[1]:GetColumnText(4))
            end):SetIcon("icon16/page_copy.png")
            menu:AddSpacer()
            menu:AddOption(GetText("clear_list"),function()
                SetDMUISkin(Derma_Query(GetText("undo_warn"),GetText("clear_songlist_title"),GetText("sure"),function()
                    if #self:GetLines() ~= 0 then
                        for i=1,#self:GetLines() do
                            self:RemoveLine(i)
                        end
                    end
                end,GetText("cancel")))
            end):SetIcon("icon16/delete.png")
            SetUISkin(menu)
            menu:Open()
        end
        CloudMusic.Playlist = vgui.Create("DListView",CloudMusic.Body)
        do
            CloudMusic.Playlist:AddColumn(""):SetI18N("song_name",I18N_COLUMN)
            CloudMusic.Playlist:AddColumn(""):SetI18N("artist",I18N_COLUMN)
            local id_column = CloudMusic.Playlist:AddColumn("")
            id_column:SetMaxWidth(100)
            id_column:SetI18N("song_id",I18N_COLUMN)
        end
        CloudMusic.Playlist:SetSortable(false)
        CloudMusic.Playlist:SetPos(winw-305,44)
        CloudMusic.Playlist:SetSize(300,winh-149)
        DisableListHeader(CloudMusic.Playlist)
        function CloudMusic.Playlist:DoDoubleClick(id, line)
            CloudMusic:Play(id)
        end
        function CloudMusic.Playlist:OnRowRightClick(lineID, line)
            self:ShowMenu()
        end
        function CloudMusic.Playlist:ShowMenu()
            local menu = DermaMenu(self)
            menu:AddOption(GetText("play"),function()
                CloudMusic:Play(self:GetSelectedLine())
            end):SetIcon("icon16/transmit.png")
            menu:AddOption(GetText("next_play"),function()
                CloudMusic.NextPlay = self:GetSelectedLine()
            end):SetIcon("icon16/transmit_go.png")
            menu:AddOption(GetText("copy_songid"),function()
                SetClipboardText(self.Songs[self:GetSelectedLine()].ID)
            end):SetIcon("icon16/page_copy.png")
            menu:AddOption(GetText("copy_songurl"),function()
                SetClipboardText("https://music.163.com/song/media/outer/url?id="..self.Songs[self:GetSelectedLine()].ID)
            end):SetIcon("icon16/page_white_copy.png")
            menu:AddSpacer()
            menu:AddOption(GetText("remove_selected_songs"),function()
                local selectedCount = #self:GetSelected()
                for _=1,selectedCount do
                    table.remove(self.Songs,self:GetSelectedLine())
                end
                self:Sync()
            end):SetIcon("icon16/page_delete.png")
            menu:AddSpacer()
            menu:AddOption(GetText("clear_list"),function()
                SetDMUISkin(Derma_Query(GetText("undo_warn"),GetText("clear_playlist_title"),GetText("sure"),function()
                    self.Songs = {}
                    self:Sync()
                end,GetText("cancel")))
            end):SetIcon("icon16/delete.png")
            SetUISkin(menu)
            menu:Open()
        end
        function CloudMusic.Playlist:Save()
            SetSettings("CloudMusicPlaylist",self.Songs)
        end
        function CloudMusic.Playlist:Sync()
            self:Clear()
            for _,v in ipairs(self.Songs) do
                self:AddLine(v.Name,v.Artist,v.ID)
            end
            self:Save()
            SetUISkin(self)
        end
        function CloudMusic.Playlist:AddMusic(music)
            for _,v in pairs(self:GetLines()) do
                if v:GetColumnText(3) == music.ID then
                    return
                end
            end
            table.insert(self.Songs, music)
            self:AddLine(music.Name,music.Artist,music.ID)
            self:Save()
            if not IsValid(CloudMusic.CurrentChannel) then
                CloudMusic:Play(#self.Songs)
            end
            SetUISkin(self)
        end
        CloudMusic.Playlist.Songs = GetSettings("CloudMusicPlaylist")
        if CloudMusic.Playlist.Songs == nil then
            CloudMusic.Playlist.Songs = {}
        end
        CloudMusic.Playlist:Sync()
        CloudMusic.NextPage = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.NextPage:SetSize(45,20)
        CloudMusic.NextPage:SetColor(Color(255,255,255))
        function CloudMusic.NextPage:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(winw-10-CloudMusic.Playlist:GetWide()-self:GetWide(),19)
        end
        CloudMusic.NextPage:SetI18N("next_page")
        CloudMusic.NextPage:SetVisible(false)
        function CloudMusic.NextPage:DoClick()
            self:SetDisabled(true)
            if offset+100 > songCount then return end
            HttpPost("http://music.163.com/api/search/pc", {
                ["s"] = searchWord,
                ["type"] = "1",
                ["limit"] = "100",
                ["offset"] = tostring(offset+100)
            },function(body)
                local json = util.JSONToTable(body)
                if not json or json["code"] ~= 200 or json["result"]["songs"] == nil then
                    SetDMUISkin(Derma_Message(GetText("switch_page_failed"), GetText("error"), GetText("ok")))
                    return
                end
                CloudMusic.PrevPage:SetDisabled(false)
                offset = offset + 100
                if offset+100 > songCount then CloudMusic.NextPage:SetDisabled(true) end
                CloudMusic.Songlist:Resolve(json["result"]["songs"])
            end, function()SetDMUISkin(Derma_Message(GetText("switch_page_failed"), GetText("error"), GetText("ok"))) end,nil,function()
                self:SetDisabled(false)
            end)
        end
        CloudMusic.NextPage.Paint = ButtonPaint
        CloudMusic.PrevPage = vgui.Create("DButton",CloudMusic.Body)
        CloudMusic.PrevPage:SetPos(winw-405,19)
        CloudMusic.PrevPage:SetSize(45,20)
        CloudMusic.PrevPage:SetColor(Color(255,255,255))
        function CloudMusic.PrevPage:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(CloudMusic.NextPage:GetPos()-self:GetWide()-5,19) 
        end
        CloudMusic.PrevPage:SetI18N("prev_page")
        CloudMusic.PrevPage:SetVisible(false)
        function CloudMusic.PrevPage:DoClick()
            self:SetDisabled(true)
            if offset == 0 then return end
            HttpPost("http://music.163.com/api/search/pc", {
                ["s"] = searchWord,
                ["type"] = "1",
                ["limit"] = "100",
                ["offset"] = tostring(offset-100)
            },function(body)
                local json = util.JSONToTable(body)
                if not json or json["code"] ~= 200 or json["result"]["songs"] == nil then
                    SetDMUISkin(Derma_Message(GetText("switch_page_failed"), GetText("error"), GetText("ok")))
                    return
                end
                CloudMusic.NextPage:SetDisabled(false)
                offset = offset - 100
                if offset == 0 then CloudMusic.PrevPage:SetDisabled(true) end
                CloudMusic.Songlist:Resolve(json["result"]["songs"])
            end, function()SetDMUISkin(Derma_Message(GetText("switch_page_failed"), GetText("error"), GetText("ok"))) end,nil,function()
                self:SetDisabled(false)
            end)
        end
        CloudMusic.PrevPage.Paint = ButtonPaint
        function CloudMusic:Play(song)
            if buffering or song == nil then return end
            if type(song) == "number" then
                if #self.Playlist.Songs == 0 then
                    AddMessage(GetText("empty_playlist"))
                    return
                end
                if self.Playlist.Songs[song] then
                    self.CurrentPlaying = self.Playlist.Songs[song]
                end
                if not self.CurrentPlaying then
                    self.CurrentPlaying = self.Playlist.Songs[1]
                end
            elseif type(song) == "table" then
                self.CurrentPlaying = song
            end
            buffering = true
            self.Player.Thumbnail:SetHTML([[
                <body style="margin:0;">
                    <img src="]]..self.CurrentPlaying.Thumbnail..[[" style="width:100%;height:100%;"/>
                    <script>
                        window.onmousedown = function() {return false;}
                        window.onkeydown = function() {return false;}
                    </script>
                </body>
            ]])
            if IsValid(self.CurrentChannel) then
                self.CurrentChannel:Stop()
                self.CurrentChannel = nil
            end
            SendInfoData()
            local cId = self.CurrentPlaying.ID
            Print("Try to play "..self.CurrentPlaying.Name.." - "..self.CurrentPlaying.Artist)
            AddProgress("CloudMusicBuffering",self.CurrentPlaying.Name.." - "..self.CurrentPlaying.Artist,GetText("try_play"))
            GetSongURL(cId,function(url)
                Print("Fetch song url successed")
                sound.PlayURL(url, "noblock", function(station)
                    buffering = false
                    RemoveProgress("CloudMusicBuffering")
                    if IsValid(station) then
                        if self.CurrentPlaying ~= nil and self.CurrentPlaying.ID == cId and not IsValid(self.CurrentChannel) then
                            station:Play()
                            self.CurrentChannel = station
                            FetchLyric()
                            self.HUD:RunJavascript([[
                                setThumbnail("]]..self.CurrentPlaying.Thumbnail..[[");
                                setSongname("]]..self.CurrentPlaying.Name:JavascriptSafe()..[[");
                                setArtist("]]..self.CurrentPlaying.Artist:JavascriptSafe()..[[");
                            ]])
                            errorCount = 0
                            hook.Run("CloudMusicMusicPlaying",self.CurrentPlaying)
                            Print("Start to play "..self.CurrentPlaying.Name.." - "..self.CurrentPlaying.Artist)
                        end
                    else
                        SongPlayError()
                    end
                    SendSyncData()
                    SendInfoData()
                end)
            end,function()
                buffering = false
            end)
        end
        function CloudMusic:Next()
            if #self.Playlist.Songs == 0 then return end
            if self.CurrentPlaying then
                local found = false
                for i=1,#self.Playlist.Songs do
                    local song = self.Playlist.Songs[i]
                    if song.ID == self.CurrentPlaying.ID then
                        if i == #self.Playlist.Songs then
                            self:Play(1)
                        else
                            self:Play(i+1)
                        end
                        found = true
                        break
                    end
                end
                if not found then
                    self:Play(1)
                end
            else
                self:Play()
            end
        end
        function CloudMusic:Prev()
            if #self.Playlist.Songs == 0 then return end
            if self.CurrentPlaying then
                local found = false
                for i=1,#self.Playlist.Songs do
                    local song = self.Playlist.Songs[i]
                    if song.ID == self.CurrentPlaying.ID then
                        if i == 1 then
                            self:Play(#self.Playlist.Songs)
                        else
                            self:Play(i-1)
                        end
                        found = true
                        break
                    end
                end
                if not found then
                    self:Play(1)
                end
            else
                self:Play()
            end
        end
        CloudMusic.Player = vgui.Create("DPanel", CloudMusic.Body)
        CloudMusic.Volume = tonumber(GetSettings("CloudMusicVolume")) or 1
        CloudMusic.Player:SetPos(5,49+(winh-149))
        CloudMusic.Player:SetSize(winw-10,winh-44-(winh-149)-40)
        CloudMusic.Player.Thumbnail = vgui.Create("DHTML",CloudMusic.Player)
        CloudMusic.Player.Thumbnail:SetSize(CloudMusic.Player:GetTall(),CloudMusic.Player:GetTall())
        function CloudMusic.Player:Paint(w,h)
            local left = self:GetTall()+5
            if not CloudMusic.CurrentPlaying then return end
            if IsValid(CloudMusic.CurrentChannel) and GetSettings("CloudMusicFFT") then
                local samples = {}
                local count = CloudMusic.CurrentChannel:FFT(samples,FFT_256)
                local width = ((w-(self.Mode:GetPos()+self.Mode:GetWide()+3)-130)-count*1+1)/count
                local l = self.Mode:GetPos()+self.Mode:GetWide()+3
                for i=1,count do
                    local sample = samples[i]*2
                    surface.SetDrawColor(GetSettings("CloudMusicPlayerFFTColor"))
                    surface.DrawRect(l, h-h*sample, width, h*sample)
                    l = l + width + 1
                end
            end
            draw.DrawText(CloudMusic.CurrentPlaying.Name,"CloudMusicTitle",left,0,GetSettings("CloudMusicTextColor"))
            draw.DrawText(CloudMusic.CurrentPlaying.Artist,"CloudMusicText",left,24,GetSettings("CloudMusicTextColor"))
            if IsValid(CloudMusic.CurrentChannel) then
                local total = string.FormattedTime(CloudMusic.CurrentChannel:GetLength(), "%02i:%02i")
                local current = string.FormattedTime(CloudMusic.CurrentChannel:GetTime(), "%02i:%02i")
                draw.DrawText(current.." / "..total,"CloudMusicText",self:GetWide(),self:GetTall()-40,GetSettings("CloudMusicTextColor"),TEXT_ALIGN_RIGHT)
            end
            local maxwidth = winw-10-left
            draw.RoundedBox(2.5, left, 40, maxwidth, 5, Color(226,226,226))
            if IsValid(CloudMusic.CurrentChannel) then
                draw.RoundedBox(2.5, left, 40, CloudMusic.CurrentChannel:GetTime() / CloudMusic.CurrentChannel:GetLength() * maxwidth, 5, GetSettings("CloudMusicBarColor"))
            end
            draw.DrawText(GetText("volume"), "CloudMusicText", self:GetWide()-110, self:GetTall()-14, GetSettings("CloudMusicTextColor"),TEXT_ALIGN_RIGHT)
            draw.RoundedBox(2.5, self:GetWide()-100, self:GetTall()-9.5, 100, 5, Color(226,226,226))
            draw.RoundedBox(2.5, self:GetWide()-100, self:GetTall()-9.5, CloudMusic.Volume*100, 5, GetSettings("CloudMusicBarColor"))
            if buffering then
                draw.DrawText(GetText("trying_play"), "CloudMusicText", self.Volumeenhance:IsVisible() and self.Volumeenhance:GetPos()-5 or self.CopyLink:GetPos()-5, 3, GetSettings("CloudMusicTextColor"), TEXT_ALIGN_RIGHT)
            elseif IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED then
                draw.DrawText(GetText("buffering"), "CloudMusicText", self.Volumeenhance:IsVisible() and self.Volumeenhance:GetPos()-5 or self.CopyLink:GetPos()-5, 3, GetSettings("CloudMusicTextColor"), TEXT_ALIGN_RIGHT)
            end
        end
        function CloudMusic.Player:OnMousePressed(key)
            if key == MOUSE_LEFT then
                local x,y = self:LocalCursorPos()
                local maxwidth = winw-10-(winh-44-(winh-149)-35)
                if y >= 40 and y <= 45 and x>= winh-44-(winh-149)-35 and x <= winh-44-(winh-149)-35+maxwidth then
                    isProgDragging = true
                end
                if y >= self:GetTall()-9.5 and y <= self:GetTall()-4.5 and x >= self:GetWide()-100 and x<= self:GetWide() then
                    isVolDragging = true
                end
            end
        end
        function CloudMusic.Player:OnMouseReleased()
            isProgDragging = false
            isVolDragging = false
            SendSyncData()
        end
        function CloudMusic.Player:Think()
            if isProgDragging and IsValid(CloudMusic.CurrentChannel) then
                local x,y = self:LocalCursorPos()
                local left = x - (winh-44-(winh-149)-35)
                local maxwidth = winw-10-(winh-44-(winh-149)-35)
                local percent = left / maxwidth
                if percent < 0 then
                    percent = 0
                elseif percent > 1 then
                    percent = 1
                end
                lrcStartPos = 1
                transLrcStartPos = 1
                CloudMusic.CurrentChannel:SetTime(percent * CloudMusic.CurrentChannel:GetLength())
            end
            if isVolDragging then
                local x,y = self:LocalCursorPos()
                local left = x - (self:GetWide()-100)
                local percent = left / 100
                if percent < 0 then
                    percent = 0
                elseif percent > 1 then
                    percent = 1
                end
                CloudMusic.Volume = percent
                SetSettings("CloudMusicVolume",percent)
            end
            if not CloudMusic.CurrentPlaying then
                self.Prev:SetVisible(false)
                self.PlayPause:SetVisible(false)
                self.Next:SetVisible(false)
                self.Mode:SetVisible(false)
                self.CopyLink:SetVisible(false)
                self.Volumeenhance:SetVisible(false)
            elseif not (self.Prev:IsVisible() or self.PlayPause:IsVisible() or self.Next:IsVisible() or self.Mode:IsVisible() or self.Mode:IsVisible() or self.CopyLink:IsVisible()) then
                self.Prev:SetVisible(true)
                self.PlayPause:SetVisible(true)
                self.Next:SetVisible(true)
                self.Mode:SetVisible(true)
                self.CopyLink:SetVisible(true)
            end
            if CloudMusic.Volume >= 1 and CloudMusic.CurrentPlaying ~= nil then
                self.Volumeenhance:SetVisible(true)
            end
        end
        CloudMusic.Player.Prev = vgui.Create("DButton",CloudMusic.Player)
        function CloudMusic.Player.Prev:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,18)
            self:SetPos(CloudMusic.Player:GetTall()+5,48)
        end
        CloudMusic.Player.Prev:SetI18N("prev_song")
        CloudMusic.Player.Prev.DoClick = function()
            CloudMusic:Prev()
        end
        CloudMusic.Player.Prev.Paint = ButtonPaint
        function CloudMusic.Player.Prev:Think()
            if self:GetDisabled() ~= not IsValid(CloudMusic.CurrentChannel) then
                self:SetDisabled(not IsValid(CloudMusic.CurrentChannel))
            end
        end
        CloudMusic.Player.PlayPause = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.PlayPause:SetI18N("play")
        function CloudMusic.Player.PlayPause:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,18)
            self:SetPos(CloudMusic.Player.Prev:GetPos()+CloudMusic.Player.Prev:GetWide()+5,48)
        end
        CloudMusic.Player.PlayPause.DoClick = function()
            if CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED then
                CloudMusic.CurrentChannel:Pause()
            elseif CloudMusic.CurrentChannel:GetState() ~= GMOD_CHANNEL_PLAYING then
                CloudMusic.CurrentChannel:Play()
            end
            SendInfoData()
        end
        CloudMusic.Player.PlayPause.Paint = ButtonPaint
        function CloudMusic.Player.PlayPause:Think()
            if IsValid(CloudMusic.CurrentChannel) then
                self:SetDisabled(false)
                if CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED then
                    self:SetI18N("pause")
                else
                    self:SetI18N("play")
                end
            elseif not self:GetDisabled() then
                self:SetI18N("play")
                self:SetDisabled(true)
            end
        end
        CloudMusic.Player.Next = vgui.Create("DButton",CloudMusic.Player)
        function CloudMusic.Player.Next:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,18)
            self:SetPos(CloudMusic.Player.PlayPause:GetPos()+CloudMusic.Player.PlayPause:GetWide()+5,48)
        end
        CloudMusic.Player.Next:SetI18N("next_song")
        CloudMusic.Player.Next.DoClick = function()
            CloudMusic:Next()
        end
        CloudMusic.Player.Next.Paint = ButtonPaint
        function CloudMusic.Player.Next:Think()
            if self:GetDisabled() ~= not IsValid(CloudMusic.CurrentChannel) then
                self:SetDisabled(not IsValid(CloudMusic.CurrentChannel))
            end
        end
        CloudMusic.Player.Mode = vgui.Create("DButton",CloudMusic.Player)
        CloudMusic.Player.Mode:SetI18N("list_loop")
        function CloudMusic.Player.Mode:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,18)
            self:SetPos(CloudMusic.Player.Next:GetPos()+CloudMusic.Player.Next:GetWide()+5,48)
        end
        function CloudMusic.Player.Mode:DoClick()
            if GetSettings("CloudMusicPlayMode") == "ListLoop" then
                SetSettings("CloudMusicPlayMode","SingleLoop")
            elseif GetSettings("CloudMusicPlayMode") == "SingleLoop" then
                SetSettings("CloudMusicPlayMode","Random")
            elseif GetSettings("CloudMusicPlayMode") == "Random" then
                SetSettings("CloudMusicPlayMode","List")
            elseif GetSettings("CloudMusicPlayMode") == "List" then
                SetSettings("CloudMusicPlayMode","ListLoop")
            end
            SetSettings("CloudMusicPlayMode",GetSettings("CloudMusicPlayMode"))
        end
        CloudMusic.Player.Mode.Paint = ButtonPaint
        function CloudMusic.Player.Mode:Think()
            if GetSettings("CloudMusicPlayMode") == "ListLoop" then
                self:SetI18N("list_loop")
            elseif GetSettings("CloudMusicPlayMode") == "SingleLoop" then
                self:SetI18N("single_loop")
            elseif GetSettings("CloudMusicPlayMode") == "Random" then
                self:SetI18N("random_play")
            elseif GetSettings("CloudMusicPlayMode") == "List" then
                self:SetI18N("list_play")
            end
        end
        CloudMusic.Player.CopyLink = vgui.Create("DButton",CloudMusic.Player)
        function CloudMusic.Player.CopyLink:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(CloudMusic.Player:GetWide()-self:GetWide(),0)
        end
        CloudMusic.Player.CopyLink:SetI18N("copy_link")
        CloudMusic.Player.CopyLink.DoClick = function()
            SetClipboardText("https://music.163.com/song/media/outer/url?id="..CloudMusic.CurrentPlaying.ID..".mp3")
        end
        CloudMusic.Player.CopyLink.Paint = ButtonPaint
        CloudMusic.Player.Volumeenhance = vgui.Create("DButton",CloudMusic.Player)
        function CloudMusic.Player.Volumeenhance:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(CloudMusic.Player.CopyLink:GetPos()-self:GetWide()-5,0)
        end
        CloudMusic.Player.Volumeenhance.DoClick = function()
            if not GetSettings("CloudMusicVolumeenhance") then
                SetSettings("CloudMusicVolumeenhance",true)
            else
                CloudMusic.Volume = 1
                SetSettings("CloudMusicVolume",1)
                SetSettings("CloudMusicVolumeenhance",false)
            end
        end
        function CloudMusic.Player.Volumeenhance:Think()
            self:SetI18N(GetSettings("CloudMusicVolumeenhance") and "disable_volume_enhance" or "enable_volume_enhance")
            if CloudMusic.Volume >= 1 then
                if GetSettings("CloudMusicVolumeenhance") and CloudMusic.Volume ~= 2 then
                    CloudMusic.Volume = 2
                    SetSettings("CloudMusicVolume",2)
                end
            elseif self:IsVisible() then
                self:SetVisible(false)
            end
        end
        CloudMusic.Player.Volumeenhance.Paint = ButtonPaint
        CloudMusic.HUD = vgui.Create("DHTML")
        CloudMusic.HUD:ParentToHUD()
        CloudMusic.HUD:SetSize(ScrW(),ScrH())
        CloudMusic.HUD:SetHTML([[
            <html>
                <head>
                    <style>
                        @keyframes progress {
                            from {
                                transform: translateX(46px);
                            }
                            to { 
                                transform: translateX(0);
                            }
                        }
                        .hud { position: fixed; }
                        .hud.top-left { top: 5px; left: 5px; }
                        .hud.top-right { top: 5px; right: 5px; text-align: right; }
                        .hud.bottom-left { bottom: 5px; left: 5px; }
                        .hud.bottom-right { bottom: 5px; right: 5px; text-align: right; }
                        .circle-bar { display:inline-block; font-size:200px; width: 36px; height: 36px; position: relative; background-color: #66CCFF; }
                        .circle-bar-left,.circle-bar-right { width: 36px; height: 36px; background-color: white; }
                        .circle-bar-right { clip:rect(0,auto,auto,18px); }
                        .circle-bar-left { clip:rect(0,18px,auto,0); }
                        .circle-bar * {  position: absolute; top:0; right:0; bottom:0; left:0; margin:auto; }
                        .circle-bar, .circle-bar > * { border-radius: 50%; }
                        .circle-bar > .thumbnail { width:32px; height:32px; position:absolute; top:0px; left:0px; z-index:2; }
                        .song-info { display:inline-block; }
                        .song-info > .artist { font-size:12px; }
                        .hud .lyric > span:first-of-type { font-size:18px; }
                        .hud .lyric > span:last-of-type { font-size:12px; }
                        .lyric > span { -webkit-transition:all .1s linear; opacity:1; }
                        .hud.bottom-left .lyric, .hud.bottom-right .lyric { position: relative; height: 0; top: -85px; }
                        .hud.top-right .circle-bar, .hud.bottom-right .circle-bar { float: right; }
                        .hud.top-right .song-info, .hud.bottom-right .song-info { text-align: right; position: absolute; right: 41px; }
                        .hud.top-right .lyric, .hud.bottom-right .lyric { margin-top: 16px; }
                        .messages { position: fixed; top: 40vh; right: 0; width: 25vw; text-shadow: none; }
                        .message { box-sizing: border-box; position: relative; color: white; width: 100%; min-height: 60px; padding: 10px; border-top-left-radius: 6px; border-bottom-left-radius: 6px; box-shadow: 0 0 6px #333; background-color: #6CF; margin-bottom: 20px; transition: all .3s linear; }
                        .message.error { background-color: #d81e06; }
                        .message.success { background-color: #1afa29; }
                        .message.progress { background: transparent; overflow: hidden; }
                        .message.progress::before { position: absolute; z-index: -1; top: 0; left: -46px; right: 0; height: 100%; content: ''; background: repeating-linear-gradient(55deg,#6cf 1px,#74d9ff 2px,#74d9ff 11px,#6cf 12px,#6cf 20px); animation-name: progress; animation-duration: 1s; animation-timing-function: linear; animation-iteration-count: infinite; }
                        .message .icon { width: 40px; height: 40px; position: absolute; top: 10px; left: 10px; }
                        .message .title { font-size: 20px; margin-left: 45px; white-space: normal; word-break: break-all; }
                        .message .content { font-size: 14px; margin-left: 45px; white-space: normal; word-break: break-all; }
                        body { word-break:keep-all; white-space:nowrap; font-family:'Microsoft YaHei',黑体; color:white; transition:all .3s linear; overflow:hidden; }
                        body.hide > *:not(.messages) { opacity:0; transition:all .3s linear; }
                        body > .lyric { position:fixed; bottom:0; width:100%; text-align:center; visibility:hidden; }
                        body.center-lyric > .lyric { visibility:visible; }
                        body.center-lyric .hud .lyric { visibility:hidden; }
                        body.text-shadow { text-shadow: 1px 1px 2px #666; }
                    </style>
                    <style id="spec-lrc"></style>
                    <style id="custom"></style>
                </head>
                <body class="hide">
                    <div class="hud">
                        <div class="circle-bar">
                            <div class="circle-bar-left"></div>
                            <div class="circle-bar-right"></div>
                            <img src="" class="thumbnail"/>
                        </div>
                        <div class="song-info">
                            <span class="name"></span><br/>
                            <span class="artist"></span>
                        </div>
                        <br/>
                        <div class="lyric">
                            <span></span>
                            <br/>
                            <span></span>
                        </div>
                    </div>
                    <div class="lyric">
                        <span></span>
                        <br/>
                        <span></span>
                    </div>
                    <div class="messages"></div>
                    <script>
                        Element.prototype.css = function(property,value){
                            if ( value ) {
                                var index = property.indexOf('-');
                                if( index != -1 ) {
                                    var char = property.charAt(index+1).toUpperCase();
                                    property.replace(/(-*){1}/,char);
                                }
                                this.style[property] = value;
                            }else{
                                return window.getComputedStyle(this).getPropertyValue(property);
                            }
                        }
                        Element.prototype.css3 = function(property,value){
                            if( value ){
                                property = capitalize(property.toLowerCase());
                                this.style['webkit'+property] = value;
                                this.style[property.toLowerCase()] = value;
                            }else{
                                return window.getComputedStyle(this).getPropertyValue(
                                        ('webkit'+property)||property);
                            }
                            function capitalize(word){
                                return word.charAt(0).toUpperCase() + word.slice(1);
                            }
                        }
                        var circleBar = document.getElementsByClassName('circle-bar')[0];
                        var color = circleBar.css('background-color');
                        var left_circle = circleBar.getElementsByClassName('circle-bar-left')[0];
                        var right_circle = circleBar.getElementsByClassName('circle-bar-right')[0];
                        var right_circle_ori = right_circle.css('background-color');
                        function setPercent(percent) {
                            if( percent <= 50 ) {
                                var rotate = 'rotate('+(percent*3.6)+'deg)';
                                right_circle.css3('transform',rotate);
                                right_circle.css('background-color',right_circle_ori);
                                left_circle.css3('transform','rotate(0deg)');
                            } else {
                                var rotate = 'rotate('+((percent-50)*3.6)+'deg)';
                                right_circle.css('background-color',color);
                                right_circle.css3('transform','rotate(0deg)');
                                left_circle.css3('transform',rotate);
                            }
                        }
                        function setThumbnail(src) {
                            setLrc("","");
                            setPercent(0);
                            document.getElementsByClassName("thumbnail")[0].src = src;
                        }
                        function setSongname(name) {
                            setLrc("","");
                            setPercent(0);
                            document.getElementsByClassName("name")[0].innerText = name;
                        }
                        function setArtist(artist) {
                            setLrc("","");
                            setPercent(0);
                            document.getElementsByClassName("artist")[0].innerText = artist;
                        }
                        function setLrc(first,second) {
                            var sTextFade = function(el,text,mode) {
                                if (el.last == text) {
                                    return;
                                }
                                el.style.opacity = "0";
                                setTimeout(function() {
                                    if (mode == "html") {
                                        el.innerHTML = text;
                                    } else {
                                        el.innerText = text;
                                    }
                                    el.last = text;
                                    el.style.opacity = "1";
                                },100);
                            }
                            var ls = document.getElementsByClassName("lyric");
                            for (var i=0;i<ls.length;i++) {
                                var el = ls[i];
                                sTextFade(el.children[0],first == "" ? "&nbsp;" : first,first == "" ? "html" : "text");
                                sTextFade(el.children[2],second == "" ? "&nbsp;" : second,second == "" ? "html" : "text");
                            }
                        }
                        function setTextColor(r,g,b) {
                            document.body.style.cssText = "color:rgb("+r+","+g+","+b+");";
                        }
                        function setUnplayedColor(r,g,b) {
                            right_circle_ori = "rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar-left")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar-right")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                        }
                        function setPlayedColor(r,g,b) {
                            color = "rgb("+r+","+g+","+b+")";
                            document.getElementsByClassName("circle-bar")[0].style.cssText = "background-color:rgb("+r+","+g+","+b+")";
                        }
                        function setHudPos(pos) {
                            document.getElementsByClassName("hud")[0].className = "hud " + pos;
                        }
                        function setCustomCSS(css) {
                            document.getElementById("custom").innerHTML = css;
                        }
                        function setLyricCentered(centered) {
                            if (centered) {
                                document.body.classList.add("center-lyric");
                            } else {
                                document.body.classList.remove("center-lyric");
                            }
                        }
                        function setLyricSize(size) {
                            document.getElementById("spec-lrc").innerHTML = "body > .lyric > span:first-of-type { font-size:"+size+"px; } body > .lyric > span:last-of-type { font-size:"+(size-6)+"px; }";
                        }
                        function setTextShadow(shadow) {
                            if (shadow) {
                                document.body.classList.add("text-shadow");
                            } else {
                                document.body.classList.remove("text-shadow");
                            }
                        }
                        function show() {
                            setPercent(0);
                            document.body.classList.remove("hide");
                        }
                        function hide() {
                            setPercent(0);
                            document.body.classList.add("hide");
                        }
                        function addCSS(css) {
                            var el = document.createElement("style");
                            if (el.styleSheet) {
                                el.styleSheet.cssText = css;
                            } else {
                                el.appendChild(document.createTextNode(css));
                            }
                            el.className = "custom-css";
                            document.body.appendChild(el);
                        }
                        function removeAllCSS() {
                            var els = document.querySelectorAll(".custom-css");
                            for (var i=0;i<els.length;i++) {
                                els[i].parentNode.removeChild(els[i]);
                            }
                        }
                        function addMessage(message,title,timeout,type) {
                            if (title == "") {
                                title = undefined;
                            }
                            if (timeout == undefined) {
                                timeout = 3000;
                            }
                            if (type == undefined) {
                                type = "";
                            }
                            var msg = document.createElement("div");
                            msg.classList.add("message");
                            if (type != "") {
                                msg.classList.add(type);
                            }
                            var iurl = "https://cm.luotianyi.me/resources/info.png";
                            switch(type) {
                                case "error":
                                    iurl = "https://cm.luotianyi.me/resources/error.png";
                                    break;
                                case "success":
                                    iurl = "https://cm.luotianyi.me/resources/success.png";
                                    break;
                            }
                            var icon = document.createElement("img");
                            icon.classList.add("icon");
                            icon.src = iurl;
                            msg.appendChild(icon);
                            var content = document.createElement("div");
                            content.innerText = message;
                            if (title != undefined) {
                                var tel = document.createElement("div");
                                tel.innerText = title;
                                tel.classList.add("title");
                                msg.appendChild(tel);
                                content.classList.add("content");
                            } else {
                                content.classList.add("title");
                            }
                            msg.appendChild(content);
                            msg.style.transform = "translate(100%)";
                            document.querySelector(".messages").appendChild(msg);
                            setTimeout(function() {
                                msg.style.transform = "translate(0)";
                            });
                            setTimeout(function() {
                                msg.style.overflow = "hidden";
                                msg.style.minHeight = "0";
                                msg.style.height = "0";
                                msg.style.margin = "0";
                                msg.style.padding = "0 10px";
                                setTimeout(function() {
                                    msg.parentNode.removeChild(msg);
                                },300);
                            },300+timeout);
                        }
                        function addProgress(name,message,title) {
                            if (name == undefined) {return;}
                            if (title == "") {
                                title = undefined;
                            }
                            var msg = document.createElement("div");
                            msg.classList.add("message");
                            msg.classList.add("progress");
                            msg.classList.add(name);
                            var icon = document.createElement("img");
                            icon.classList.add("icon");
                            icon.src = "https://cm.luotianyi.me/resources/info.png";
                            msg.appendChild(icon);
                            var content = document.createElement("div");
                            content.innerText = message;
                            if (title != undefined) {
                                var tel = document.createElement("div");
                                tel.innerText = title;
                                tel.classList.add("title");
                                msg.appendChild(tel);
                                content.classList.add("content");
                            } else {
                                content.classList.add("title");
                            }
                            msg.appendChild(content);
                            msg.style.transform = "translate(100%)";
                            document.querySelector(".messages").appendChild(msg);
                            setTimeout(function() {
                                msg.style.transform = "translate(0)";
                            });
                        }
                        function removeProgress(name) {
                            for (var msg of document.querySelectorAll(".message." + name)) {
                                msg.style.overflow = "hidden";
                                msg.style.minHeight = "0";
                                msg.style.height = "0";
                                msg.style.margin = "0";
                                msg.style.padding = "0 10px";
                                setTimeout(function() {
                                    msg.parentNode.removeChild(msg);
                                },300);
                            }
                        }
                    </script>
                </body>
            </html>
        ]])
        function CloudMusic.HUD:OnDocumentReady()
            self.Ready = true
            local text = GetSettings("CloudMusicHUDTextColor")
            local progressUnplayed = GetSettings("CloudMusicHUDProgressUnplayedColor")
            local progressPlayed = GetSettings("CloudMusicHUDProgressPlayedColor")
            self:RunJavascript([[
                setTextColor(]]..text.r..[[,]]..text.g..[[,]]..text.b..[[);
                setUnplayedColor(]]..progressUnplayed.r..[[,]]..progressUnplayed.g..[[,]]..progressUnplayed.b..[[);
                setPlayedColor(]]..progressPlayed.r..[[,]]..progressPlayed.g..[[,]]..progressPlayed.b..[[)
                setHudPos("]]..GetSettings("CloudMusicHudPos")..[[");
                setCustomCSS("]]..GetSettings("CloudMusicHUDCustomCSS")..[[");
                setLyricCentered(]]..(GetSettings("CloudMusicLyricCentered") and "true" or "false")..[[);
                setLyricSize(]]..GetSettings("CloudMusicLyricSize")..[[);
                setTextShadow(]]..(GetSettings("CloudMusicHUDTextShadow") and "true" or "false")..[[);
            ]])
            hook.Run("CloudMusicHUDReady")
            Print("HUD ready")
        end
        function CloudMusic.HUD:OnScreenSizeChanged()
            self:SetSize(ScrW(),ScrH())
        end
        function CloudMusic.HUD:Think()
            if lrc and IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING then
                local mainLrc = ""
                local subLrc = ""
                for i=lrcStartPos,#lrc do
                    local line = lrc[i]
                    if not IsValid(CloudMusic.CurrentChannel) then break end
                    if i == #lrc or lrc[i+1].Time > CloudMusic.CurrentChannel:GetTime()*1000 then
                        if lrc[i].Time < CloudMusic.CurrentChannel:GetTime()*1000 then
                            mainLrc = line.Value
                            if not transLrc and i ~= #lrc then
                                subLrc = lrc[i+1].Value
                            end
                        else
                            lrcStartPos = 1
                            break
                        end
                        lrcStartPos = i
                        break
                    end
                end
                if transLrc and mainLrc ~= "" then
                    for i=transLrcStartPos,#transLrc do
                        local line = transLrc[i]
                        if not IsValid(CloudMusic.CurrentChannel) then break end
                        if i == #transLrc or transLrc[i+1].Time > CloudMusic.CurrentChannel:GetTime()*1000 then
                            if transLrc[i].Time < CloudMusic.CurrentChannel:GetTime()*1000 then
                                subLrc = line.Value
                            else
                                transLrcStartPos = 1
                                break
                            end
                            transLrcStartPos = i
                            break
                        end
                    end
                end
                if self.Ready then
                    self:RunJavascript([[
                        setLrc("]]..mainLrc:JavascriptSafe()..[[","]]..subLrc:JavascriptSafe()..[[");
                    ]])
                end
            end
        end
        function CloudMusic.HUD:CMUpdate()
            if not self.Ready then
                return
            end
            if IsValid(CloudMusic.CurrentChannel) then
                if CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED or CloudMusic.Settings.HUDCustomCSS.Focused then
                    if self.State ~= "SHOW" then
                        self:RunJavascript("show()")
                        self.State = "SHOW"
                    end
                elseif self.State ~= "HIDE" then
                    self:RunJavascript("hide()")
                    self.State = "HIDE"
                end
                self:RunJavascript([[
                    setPercent(]]..(CloudMusic.CurrentChannel:GetTime() / CloudMusic.CurrentChannel:GetLength() * 100)..[[);
                ]])
            else
                self:RunJavascript("hide()")
                self.State = "HIDE"
            end
        end
        function CloudMusic.HUD:Paint(w,h)
            if IsValid(CloudMusic.CurrentChannel) and GetSettings("CloudMusicHUDFFT") then
                local samples = {}
                local count = CloudMusic.CurrentChannel:FFT(samples,FFT_256)
                local height = (h*0.7-count*1+1)/count
                local top = h/2-h*0.7/2
                for i=1,count do
                    local sample = samples[i]
                    surface.SetDrawColor(GetSettings("CloudMusicHUDFFTColor"))
                    surface.DrawRect(0, top, (w*0.3)*sample, height)
                    top = top + height + 1
                end
            end
        end
        CloudMusic.Settings = vgui.Create("DPanel",CloudMusic)
        CloudMusic.Settings:SetPos(winw,30)
        CloudMusic.Settings:SetSize(winw,winh-30)
        function CloudMusic.Settings:Paint(w,h)
            draw.DrawText(GetText("settings"), "CloudMusicSubTitle", 5, 5, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("display_ui_fft"), "CloudMusicText", 25, 30, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("display_hud_fft"), "CloudMusicText", 25, 50, GetSettings("CloudMusicTextColor"))
            if GetSettings("CloudMusicHUDFFT") then
                surface.SetFont("CloudMusicText")
                draw.DrawText(GetText("hud_fft_warn"), "CloudMusicText", 25+surface.GetTextSize(GetText("display_hud_fft")), 50, Color(255,0,0))
            end
            draw.DrawText(GetText("display_lyric"), "CloudMusicText", 25, 70, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("enable_animation"), "CloudMusicText", 25, 90, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("enable_3dplay"), "CloudMusicText", 160, 30, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("bypass_3dplay"), "CloudMusicText", 160, 70, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("center_lyric"), "CloudMusicText", 160, 90, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("hud_pos"), "CloudMusicText", 320, 32, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("use_server_link"), "CloudMusicText", 340, 50, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("hud_text_shadow"), "CloudMusicText", 340, 70, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("ui_color"), "CloudMusicSmallTitle", 5, 112, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("player_list"), "CloudMusicSmallTitle", 170, 112, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("custom_css"), "CloudMusicSmallTitle", 475, 112, GetSettings("CloudMusicTextColor"))
            draw.DrawText(GetText("description"), "CloudMusicText", w/2, h-50, GetSettings("CloudMusicTextColor"), TEXT_ALIGN_CENTER)
            draw.DrawText("v"..CLOUDMUSIC_VER..(cmStatus == CM_VER_OUDATED and GetText("outdated") or (cmStatus == CM_VER_MODIFIED and GetText("modified") or "")).."\n"..GetText("advice"), "CloudMusicText", 5, winh-63, GetSettings("CloudMusicTextColor"))
        end
        function CloudMusic.Settings:Think()
            if currentShowingPage == "Main" and (self:GetPos()) < winw then
                if GetSettings("CloudMusicAnimation") then
                    self:SetPos((self:GetPos())+slideAnimPix,30)
                else
                    self:SetPos(winw,30)
                end
            elseif currentShowingPage == "Settings" and (self:GetPos()) ~= 0 then
                if GetSettings("CloudMusicAnimation") then
                    self:SetPos((self:GetPos())-slideAnimPix,30)
                    if (self:GetPos()) < 0 then self:SetPos(0,30) end
                else
                    self:SetPos(0,30)
                end
            end
        end
        CloudMusic.Settings.Back = vgui.Create("DButton",CloudMusic.Settings)
        CloudMusic.Settings.Back:SetPos(50,5)
        CloudMusic.Settings.Back:SetSize(30,20)
        function CloudMusic.Settings.Back:LangUpdate()
            self:SizeToContents()
            surface.SetFont("CloudMusicSubTitle")
            self:SetPos(surface.GetTextSize(GetText("settings"))+15,5)
            self:SetSize(self:GetWide(),20)
        end
        CloudMusic.Settings.Back:SetI18N("back")
        CloudMusic.Settings.Back:SetColor(Color(255,255,255))
        CloudMusic.Settings.Back.DoClick = function()currentShowingPage = "Main"end
        CloudMusic.Settings.Back.Paint = ButtonPaint
        CloudMusic.Settings.FFT = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.FFT:SetPos(5,30)
        CloudMusic.Settings.FFT:SetChecked(GetSettings("CloudMusicFFT"))
        function CloudMusic.Settings.FFT:OnChange(val)
            SetSettings("CloudMusicFFT", val)
        end
        CloudMusic.Settings.HUDFFT = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.HUDFFT:SetPos(5,50)
        CloudMusic.Settings.HUDFFT:SetChecked(GetSettings("CloudMusicHUDFFT"))
        function CloudMusic.Settings.HUDFFT:OnChange(val)
            SetSettings("CloudMusicHUDFFT", val)
        end
        CloudMusic.Settings.Lyric = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.Lyric:SetPos(5,70)
        CloudMusic.Settings.Lyric:SetChecked(GetSettings("CloudMusicLyric"))
        function CloudMusic.Settings.Lyric:OnChange(val)
            lrc = nil
            transLrc = nil
            CloudMusic.HUD:RunJavascript([[
                setLrc("","");
            ]])
            if val and CloudMusic.CurrentPlaying then
                FetchLyric()
            end
            SetSettings("CloudMusicLyric", val)
        end
        CloudMusic.Settings.Animation = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.Animation:SetPos(5,90)
        CloudMusic.Settings.Animation:SetChecked(GetSettings("CloudMusicAnimation"))
        function CloudMusic.Settings.Animation:OnChange(val)
            SetSettings("CloudMusicAnimation",val)
        end
        CloudMusic.Settings.A3D = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.A3D:SetPos(140,30)
        if ULib == nil or ULib.ucl.query(LocalPlayer(),"cloudmusic3d") then
            CloudMusic.Settings.A3D:SetChecked(GetSettings("CloudMusic3D"))
        else
            CloudMusic.Settings.A3D:SetChecked(false)
        end
        function CloudMusic.Settings.A3D:OnChange(val)
            if ULib ~= nil and not ULib.ucl.query(LocalPlayer(),"cloudmusic3d") and val then
                SetDMUISkin(Derma_Message(GetText("3dplay_noperm"), GetText("no_perm"), GetText("ok")))
                self:SetChecked(false)
                return
            end
            SetSettings("CloudMusic3D", val)
            if val then
                SendSyncData()
            else
                net.Start("CloudMusic3DSync")
                net.WriteEntity(LocalPlayer())
                net.WriteBool(false)
                net.WriteInt(-1,32)
                net.WriteFloat(0)
                net.WriteString("")
                net.WriteFloat(0)
                net.SendToServer()
            end
        end
        function CloudMusic.Settings.A3D:Think()
            if ULib ~= nil and not ULib.ucl.query(LocalPlayer(),"cloudmusic3d") and self:GetChecked() then
                self:SetChecked(false)
                net.Start("CloudMusic3DSync")
                net.WriteEntity(LocalPlayer())
                net.WriteBool(false)
                net.WriteInt(-1,32)
                net.WriteFloat(0)
                net.WriteString("")
                net.WriteFloat(0)
                net.SendToServer()
            end
        end
        CloudMusic.Settings.Bypass3D = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.Bypass3D:SetPos(140,70)
        CloudMusic.Settings.Bypass3D:SetChecked(GetSettings("CloudMusicBypass3D"))
        function CloudMusic.Settings.Bypass3D:OnChange(val)
            SetSettings("CloudMusicBypass3D", val)
            if val then
                for i=1,#channelPlayers do
                    local p = channelPlayers[i]
                    if IsValid(p) and IsValid(p.CM_MusicChannel) then
                        p.CM_MusicChannel:Stop()
                        p.CM_MusicChannel = nil
                    end
                end
                channelPlayers = {}
            else
                net.Start("CloudMusicReqSync")
                net.SendToServer()
            end
        end
        CloudMusic.Settings.LyricCentered = vgui.Create("DCheckBox",CloudMusic.Settings)
        CloudMusic.Settings.LyricCentered:SetPos(140,90)
        CloudMusic.Settings.LyricCentered:SetChecked(GetSettings("CloudMusicLyricCentered"))
        function CloudMusic.Settings.LyricCentered:OnChange(val)
            SetSettings("CloudMusicLyricCentered", val)
            CloudMusic.Settings.LyricSize:SetVisible(val)
            if val then
                CloudMusic.HUD:RunJavascript("setLyricCentered(true);")
            else
                CloudMusic.HUD:RunJavascript("setLyricCentered(false);")
            end
        end
        CloudMusic.Settings.HudPos = vgui.Create("DButton",CloudMusic.Settings)
        function CloudMusic.Settings.HudPos:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(320+surface.GetTextSize(GetText("hud_pos"))+3,30)
        end
        function CloudMusic.Settings.HudPos:DoClick()
            if GetSettings("CloudMusicHudPos") == "top-left" then
                SetSettings("CloudMusicHudPos","top-right")
            elseif GetSettings("CloudMusicHudPos") == "top-right" then
                SetSettings("CloudMusicHudPos","bottom-left")
            elseif GetSettings("CloudMusicHudPos") == "bottom-left" then
                SetSettings("CloudMusicHudPos","bottom-right")
            elseif GetSettings("CloudMusicHudPos") == "bottom-right" then
                SetSettings("CloudMusicHudPos","top-left")
            end
            CloudMusic.HUD:RunJavascript([[setHudPos("]]..GetSettings("CloudMusicHudPos")..[[");]])
            SetSettings("CloudMusicHudPos",GetSettings("CloudMusicHudPos"))
        end
        function CloudMusic.Settings.HudPos:Think()
            if GetSettings("CloudMusicHudPos") == "top-left" then
                self:SetI18N("top_left")
            elseif GetSettings("CloudMusicHudPos") == "top-right" then
                self:SetI18N("top_right")
            elseif GetSettings("CloudMusicHudPos") == "bottom-left" then
                self:SetI18N("bottom_left")
            elseif GetSettings("CloudMusicHudPos") == "bottom-right" then
                self:SetI18N("bottom_right")
            end
        end
        CloudMusic.Settings.HudPos.Paint = ButtonPaint
        CloudMusic.Settings.UseServer = vgui.Create("DCheckBox", CloudMusic.Settings)
        CloudMusic.Settings.UseServer:SetPos(320,50)
        CloudMusic.Settings.UseServer:SetChecked(GetSettings("CloudMusicUseServer"))
        CloudMusic.Settings.UseServer:SetI18N("use_server_link_tip",I18N_PLACEHOLDER)
        function CloudMusic.Settings.UseServer:LangUpdate()
            self:SetTooltip(GetText("use_server_link_tip"))
        end
        function CloudMusic.Settings.UseServer:OnChange(val)
            SetSettings("CloudMusicUseServer",val)
        end
        CloudMusic.Settings.HUDTextShadow = vgui.Create("DCheckBox", CloudMusic.Settings)
        CloudMusic.Settings.HUDTextShadow:SetPos(320,70)
        CloudMusic.Settings.HUDTextShadow:SetChecked(GetSettings("CloudMusicHUDTextShadow"))
        function CloudMusic.Settings.HUDTextShadow:OnChange(val)
            SetSettings("CloudMusicHUDTextShadow",val)
            CloudMusic.HUD:RunJavascript([[setTextShadow(]]..(val and "true" or "false")..[[);]])
        end
        CloudMusic.Settings.LyricSize = vgui.Create("DNumSlider", CloudMusic.Settings)
        CloudMusic.Settings.LyricSize:SetPos(320,89)
        function CloudMusic.Settings.LyricSize:LangUpdate()
            surface.SetFont("CloudMusicText")
            self:SetPos(160+surface.GetTextSize(GetText("center_lyric"))+10,select(2,self:GetPos()))
        end
        CloudMusic.Settings.LyricSize:SetI18N("lyric_size")
        CloudMusic.Settings.LyricSize:SetSize(150,20)
        CloudMusic.Settings.LyricSize:SetMin(18)
        CloudMusic.Settings.LyricSize:SetMax(32)
        CloudMusic.Settings.LyricSize:SetDefaultValue(18)
        CloudMusic.Settings.LyricSize:SetValue(GetSettings("CloudMusicLyricSize"))
        CloudMusic.Settings.LyricSize:SetVisible(GetSettings("CloudMusicLyricCentered"))
        CloudMusic.Settings.LyricSize.OldValueChanged = CloudMusic.Settings.LyricSize.ValueChanged
        function CloudMusic.Settings.LyricSize:ValueChanged(val)
            SetSettings("CloudMusicLyricSize",val)
            CloudMusic.HUD:RunJavascript([[setLyricSize(]]..val..[[);]])
            self:OldValueChanged()
        end
        CloudMusic.Settings.Playerlist = vgui.Create("DListView",CloudMusic.Settings)
        do
            CloudMusic.Settings.Playerlist:AddColumn(""):SetI18N("player_name",I18N_COLUMN)
            CloudMusic.Settings.Playerlist:AddColumn("SteamID64")
            local blacklist = CloudMusic.Settings.Playerlist:AddColumn("")
            blacklist:SetMaxWidth(55)
            blacklist:SetI18N("blacklist",I18N_COLUMN)
        end
        CloudMusic.Settings.Playerlist:SetPos(170,130)
        CloudMusic.Settings.Playerlist:SetSize(300,250)
        CloudMusic.Settings.Playerlist:SetMultiSelect(false)
        CloudMusic.Settings.Playerlist:SetSortable(false)
        DisableListHeader(CloudMusic.Settings.Playerlist)
        function CloudMusic.Settings.Playerlist:DoDoubleClick()
            if self:GetSelectedLine() == nil then return end
            local line = self:GetSelected()[1]
            local p = player.GetBySteamID64(line:GetColumnText(2))
            local w = vgui.Create("DPanel",CloudMusic)
            w:SetZPos(2)
            w:SetSize(winw*0.8,(winh-30)*0.9)
            w:SetPos(winw/2-(winw*0.8/2),winh/2-((winh-30)*0.9)/2)
            w.Avatar = vgui.Create("AvatarImage",w)
            w.Avatar:SetPos(5,5)
            w.Avatar:SetSize(64,64)
            w.Avatar:SetPlayer(p,64)
            w.Name = vgui.Create("DLabel",w)
            w.Name:SetPos(70,5)
            w.Name:SetFont("CloudMusicTitle")
            w.Name:SetText(p:Nick())
            w.Name:SizeToContents()
            w.Status = vgui.Create("DLabel",w)
            w.Status:SetPos(70,5+select(2,w.Name:GetSize()))
            w.Status:SetFont("CloudMusicText")
            function w.Status:LangUpdate()
                self:SizeToContents()
            end
            w.Status:SetI18N("wait")
            w.Thumbnail = vgui.Create("DHTML",w)
            w.Thumbnail:SetPos(5,74)
            w.Thumbnail:SetSize(64,64)
            w.Thumbnail:SetVisible(false)
            w.SongName = vgui.Create("DLabel",w)
            w.SongName:SetPos(70,74)
            w.SongName:SetFont("CloudMusicTitle")
            w.SongName:SetVisible(false)
            w.Details = vgui.Create("DLabel",w)
            w.Details:SetFont("CloudMusicText")
            w.Details:SetVisible(false)
            w.Close = vgui.Create("DButton",w)
            w.Close:SetPos(5,select(2,w:GetSize())-25)
            w.Close:SetSize(w:GetSize()-10,20)
            w.Close:SetI18N("close")
            function w.Close:DoClick()
                HideOverlay()
                w:Remove()
            end
            function w:UpdateInfo()
                local stat = "no_info"
                if p.CM_MusicInfo["Status"] == CM_STATUS_PLAYING then
                    stat = "playing"
                elseif p.CM_MusicInfo["Status"] == CM_STATUS_PAUSE then
                    stat = "paused"
                end
                self.Status:SetI18N(stat)
                if p.CM_MusicInfo["Status"] ~= CM_STATUS_NON_INFO then
                    self.Thumbnail:SetHTML([[
                        <body style="margin:0;">
                            <img src="]]..p.CM_MusicInfo["Thumbnail"]..[[" style="width:100%;height:100%;"/>
                            <script>
                                window.onmousedown = function() {return false;}
                                window.onkeydown = function() {return false;}
                            </script>
                        </body>
                    ]])
                    self.SongName:SetText(p.CM_MusicInfo["Name"])
                    self.SongName:SizeToContents()
                    self.Details:SetPos(70,74+select(2,self.SongName:GetSize()))
                    self.Details:SetText(p.CM_MusicInfo["Artist"].." · "..p.CM_MusicInfo["Album"])
                    self.Details:SizeToContents()
                    self.Thumbnail:SetVisible(true)
                    self.SongName:SetVisible(true)
                    self.Details:SetVisible(true)
                else
                    self.Thumbnail:SetVisible(false)
                    self.SongName:SetVisible(false)
                    self.Details:SetVisible(false)
                end
            end
            w:UpdateInfo()
            CloudMusic.PlayerInfo = w
            SetUISkin(w)
            ShowOverlay()
        end
        function CloudMusic.Settings.Playerlist:OnRowRightClick(lineID, line)
            self:ShowMenu()
        end
        function CloudMusic.Settings.Playerlist:ShowMenu()
            local menu = DermaMenu(self)
            menu:AddOption(GetText("add_remove_blacklist"),function()
                local selected = self:GetSelected()[1]
                if selected.Blacklisted then
                    for i=1,#self.BlacklistUsers do
                        if self.BlacklistUsers[i].ID == selected:GetColumnText(2) then
                            table.remove(self.BlacklistUsers,i)
                            break
                        end
                    end
                    net.Start("CloudMusicReqSync")
                    net.SendToServer()
                else
                    for _,v in pairs(player.GetAll()) do
                        if IsValid(v.CM_MusicChannel) and v:SteamID64() == selected:GetColumnText(2) then
                            v.CM_MusicChannel:Stop()
                            v.CM_MusicChannel = nil
                            break
                        end
                    end
                    table.insert(self.BlacklistUsers,{
                        Name = selected:GetColumnText(1),
                        ID = selected:GetColumnText(2)
                    })
                end
                self:SyncBlacklist()
            end):SetIcon("icon16/user_delete.png")
            menu:AddOption(GetText("copy_player_name"),function()
                SetClipboardText(self.BlacklistUsers[self:GetSelectedLine()].Name)
            end):SetIcon("icon16/page_copy.png")
            menu:AddOption(GetText("copy_steamid"),function()
                SetClipboardText(self.BlacklistUsers[self:GetSelectedLine()].ID)
            end):SetIcon("icon16/page_white_copy.png")
            menu:AddSpacer()
            menu:AddOption(GetText("remove_all_blacklist"),function()
                SetDMUISkin(Derma_Query(GetText("undo_warn"),GetText("clear_blacklist_title"),GetText("sure"),function()
                    self.BlacklistUsers = {}
                    self:SyncBlacklist()
                end,GetText("cancel")))
            end):SetIcon("icon16/delete.png")
            menu:AddOption(GetText("add_all_players_to_blacklist"),function()
                SetDMUISkin(Derma_Query(GetText("sure_warn"),GetText("all_blacklist_title"),GetText("sure"),function()
                    local players = player.GetAll()
                    for _,v in pairs(players) do
                        table.insert(self.BlacklistUsers, {
                            Name = v:Nick(),
                            ID = v:SteamID64()
                        })
                    end
                    self:SyncBlacklist()
                end,GetText("cancel")))
            end):SetIcon("icon16/book_add.png")
            SetUISkin(menu)
            menu:Open()
        end
        function CloudMusic.Settings.Playerlist:SaveBlacklist()
            SetSettings("CloudMusicBlacklistUsers",self.BlacklistUsers)
        end
        function CloudMusic.Settings.Playerlist:SyncBlacklist()
            self:Clear()
            for _,v in pairs(player.GetAll()) do
                if IsValid(v) and v ~= LocalPlayer() and not v:IsBot() then
                    local line = self:AddLine(v:Nick(),v:SteamID64(),GetText("unblocked"))
                    local blacklisted = false
                    for _,p in pairs(self.BlacklistUsers) do
                        if p.ID == v:SteamID64() then
                            blacklisted = true
                        end
                    end
                    if blacklisted then
                        line:SetColumnText(3,GetText("blocked"))
                    end
                    line.Blacklisted = blacklisted
                end
            end
            for i=1,#self.BlacklistUsers do
                local p = self.BlacklistUsers[i]
                for j=1,#self.BlacklistUsers do
                    local v = self.BlacklistUsers[j]
                    if v.ID == p.ID and i ~= j then
                        table.remove(self.BlacklistUsers,j)
                    end
                end
            end
            self:SaveBlacklist()
            SetUISkin(self)
        end
        CloudMusic.Settings.Playerlist.BlacklistUsers = GetSettings("CloudMusicBlacklistUsers")
        if CloudMusic.Settings.Playerlist.BlacklistUsers == nil then
            CloudMusic.Settings.Playerlist.BlacklistUsers = {}
        end
        CloudMusic.Settings.HUDCustomCSS = vgui.Create("DTextEntry",CloudMusic.Settings)
        CloudMusic.Settings.HUDCustomCSS:SetPos(475,130)
        CloudMusic.Settings.HUDCustomCSS:SetSize(400,250)
        CloudMusic.Settings.HUDCustomCSS:SetMultiline(true)
        CloudMusic.Settings.HUDCustomCSS:SetValue(GetSettings("CloudMusicHUDCustomCSS"))
        function CloudMusic.Settings.HUDCustomCSS:OnGetFocus()
            self.Focused = true
        end
        function CloudMusic.Settings.HUDCustomCSS:OnLoseFocus()
            self.Focused = false
        end
        function CloudMusic.Settings.HUDCustomCSS:OnChange()
            local text = self:GetValue()
            SetSettings("CloudMusicHUDCustomCSS",text)
            CloudMusic.HUD:RunJavascript([[
                setCustomCSS("]]..text:JavascriptSafe()..[[");
            ]])
        end
        CloudMusic.Settings.Colors = vgui.Create("DScrollPanel",CloudMusic.Settings)
        CloudMusic.Settings.Colors:SetPos(5,130)
        CloudMusic.Settings.Colors:SetSize(160,250)
        function CloudMusic.Settings.Colors:AddColorOption(name,bindName,callback)
            local title = self:Add("DLabel")
            title:SetTextColor(GetSettings("CloudMusicTextColor"))
            title:SetFont("CloudMusicText")
            title:SetI18N(name)
            title:Dock(TOP)
            local mixer = self:Add("DColorMixer")
            mixer:SetSize(150,200)
            mixer:SetAlphaBar(false)
            mixer:SetColor(GetSettings(bindName))
            mixer:Dock(TOP)
            mixer.BindName = bindName
            if callback ~= nil then
                mixer.Callback = callback
                if type(callback) == "function" then
                    callback(GetSettings(bindName))
                end
            end
            function mixer:ValueChanged(col)
                SetSettings(bindName,col)
                if self.Callback ~= nil and type(self.Callback) == "function" then
                    self.Callback(col)
                end
            end
            return mixer,title
        end
        CloudMusic.Settings.Colors.Reset = CloudMusic.Settings.Colors:Add("DButton")
        CloudMusic.Settings.Colors.Reset:SetSize(45,20)
        CloudMusic.Settings.Colors.Reset:SetColor(Color(255,255,255))
        CloudMusic.Settings.Colors.Reset:SetI18N("reset_all_colors")
        CloudMusic.Settings.Colors.Reset:Dock(TOP)
        function CloudMusic.Settings.Colors.Reset:DoClick()
            SetDMUISkin(Derma_Query(GetText("undo_warn"),GetText("reset_all_colors_title"),GetText("sure"),function()
                for _,v in pairs(CloudMusic.Settings.Colors:GetCanvas():GetChildren()) do
                    if v:GetName() == "DColorMixer" then
                        SetSettings(v.BindName,defaultSettings[v.BindName])
                        if v.Callback ~= nil and type(v.Callback) == "function" then
                            v.Callback(defaultSettings[v.BindName])
                        end
                    end
                end
            end,GetText("cancel")))
        end
        CloudMusic.Settings.Colors.Reset.Paint = ButtonPaint
        CloudMusic.Settings.Texas = vgui.Create("DButton",CloudMusic.Settings)
        function CloudMusic.Settings.Texas:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(winw/2-self:GetWide()-2.5,winh-66)
        end
        CloudMusic.Settings.Texas:SetI18N("contact")
        CloudMusic.Settings.Texas.DoClick = function()
            gui.OpenURL("http://steamcommunity.com/profiles/76561198163912747")
        end
        CloudMusic.Settings.Texas.Paint = ButtonPaint
        CloudMusic.Settings.Donate = vgui.Create("DButton",CloudMusic.Settings)
        function CloudMusic.Settings.Donate:LangUpdate()
            self:SizeToContents()
            self:SetSize(self:GetWide()+3,20)
            self:SetPos(winw/2+2.5,winh-66)
        end
        CloudMusic.Settings.Donate:SetI18N("donate")
        CloudMusic.Settings.Donate.DoClick = function()
            gui.OpenURL("http://texas.penguin-logistics.cn/donate")
        end
        CloudMusic.Settings.Donate.Paint = ButtonPaint
        CloudMusic.Settings.Colors:AddColorOption("text_color","CloudMusicTextColor",function(col)
            for _,v in pairs(CloudMusic.Settings.Colors:GetCanvas():GetChildren()) do
                if v:GetName() == "DLabel" then v:SetTextColor(col) end
            end
            local iter = {}
            function iter:Color(panel)
                if panel.SetColor then
                    panel:SetColor(col)
                end
                for _,v in pairs(panel:GetChildren()) do
                    self:Color(v)
                end
            end
            function iter:Run(panel)
                for _,v in pairs(panel:GetChildren()) do
                    if v:GetName() == "DListView" or v:GetName() == "DNumSlider" then
                        self:Color(v)
                    else
                        self:Run(v)
                    end
                end
            end
            iter:Run(CloudMusic)
        end)
        CloudMusic.Settings.Colors:AddColorOption("background_color","CloudMusicBackgroundColor")
        CloudMusic.Settings.Colors:AddColorOption("title_text_color","CloudMusicTitleBarTextColor")
        CloudMusic.Settings.Colors:AddColorOption("title_color","CloudMusicTitleBarColor")
        CloudMusic.Settings.Colors:AddColorOption("button_color","CloudMusicButtonColor")
        CloudMusic.Settings.Colors:AddColorOption("button_hover_color","CloudMusicButtonHoverColor")
        CloudMusic.Settings.Colors:AddColorOption("button_activate_color","CloudMusicButtonActivateColor")
        CloudMusic.Settings.Colors:AddColorOption("button_text_color","CloudMusicButtonTextColor",function(col)
            local iter = {}
            function iter:Run(panel)
                if panel:GetName() == "DButton" then
                    panel:SetColor(col)
                end
                for _,v in pairs(panel:GetChildren()) do
                    if v:GetName() ~= "DListView" then
                        self:Run(v)
                    end
                end
            end
            iter:Run(CloudMusic)
        end)
        CloudMusic.Settings.Colors:AddColorOption("input_text_color","CloudMusicTextEntryColor",function(col)
            local iter = {}
            function iter:Run(panel)
                if panel:GetName() == "DTextEntry" then
                    panel:SetTextColor(col)
                end
                for _,v in pairs(panel:GetChildren()) do
                    self:Run(v)
                end
            end
            iter:Run(CloudMusic)
        end)
        CloudMusic.Settings.Colors:AddColorOption("player_fft_color","CloudMusicPlayerFFTColor")
        CloudMusic.Settings.Colors:AddColorOption("progress_bar_color","CloudMusicBarColor")
        CloudMusic.Settings.Colors:AddColorOption("hud_text_color","CloudMusicHUDTextColor",function()
            local text = GetSettings("CloudMusicHUDTextColor")
            CloudMusic.HUD:RunJavascript([[
                setTextColor(]]..text.r..[[,]]..text.g..[[,]]..text.b..[[);
            ]])
        end)
        CloudMusic.Settings.Colors:AddColorOption("hud_played_progress_bar_color","CloudMusicHUDProgressPlayedColor",function()
            local progressPlayed = GetSettings("CloudMusicHUDProgressPlayedColor")
            CloudMusic.HUD:RunJavascript([[
                setPlayedColor(]]..progressPlayed.r..[[,]]..progressPlayed.g..[[,]]..progressPlayed.b..[[)
            ]])
        end)
        CloudMusic.Settings.Colors:AddColorOption("hud_unplayed_progress_bar_color","CloudMusicHUDProgressUnplayedColor",function()
            local progressUnplayed = GetSettings("CloudMusicHUDProgressUnplayedColor")
            CloudMusic.HUD:RunJavascript([[
                setUnplayedColor(]]..progressUnplayed.r..[[,]]..progressUnplayed.g..[[,]]..progressUnplayed.b..[[);
            ]])
        end)
        CloudMusic.Settings.Colors:AddColorOption("hud_fft_color","CloudMusicHUDFFTColor")
        --[[CloudMusic.Settings.Exusiai = vgui.Create("DHTML",CloudMusic.Settings)
        CloudMusic.Settings.Exusiai:SetPos(0,0)
        CloudMusic.Settings.Exusiai:SetSize(winw,winh-30)
        CloudMusic.Settings.Exusiai:SetZPos(-1)
        CloudMusic.Settings.Exusiai:SetHTML([[
            <body style="user-select:none;pointer-events:none;">
                <img src="http://penguin-logistics.cn/images/exusiai.png" style="position:absolute;bottom:5px;right:5px;max-height:50%;"/>
                <script>
                    window.onmousedown = function() {return false;}
                    window.onkeydown = function() {return false;}
                </script>
            </body>
        ]]--)
        CloudMusic.Settings.LuoTianyi = vgui.Create("DHTML",CloudMusic.Settings)
        CloudMusic.Settings.LuoTianyi:SetPos(0,0)
        CloudMusic.Settings.LuoTianyi:SetSize(winw,winh-30)
        CloudMusic.Settings.LuoTianyi:SetZPos(-1)
        function CloudMusic.Settings.LuoTianyi:OnDocumentReady()
            self:AddFunction("waifu","setWaifuPos",function(x,y,w,h)
                self.WaifuPos = {
                    ["x"] = x,
                    ["y"] = y,
                    ["w"] = w,
                    ["h"] = h
                }
            end)
            self:RunJavascript("reqWaifuPos();")
        end
        function CloudMusic.Settings.LuoTianyi:Think()
            if self.WaifuPos == nil then return end
            local x,y = BodyMousePos()
            if x >= self.WaifuPos["x"] and y >= self.WaifuPos["y"] and x <= self.WaifuPos["x"] + self.WaifuPos["w"] and y <= self.WaifuPos["y"] + self.WaifuPos["h"] then
                self:RunJavascript("showWaifu();")
            else
                self:RunJavascript("hideWaifu();")
            end
            if input.IsMouseDown(MOUSE_LEFT) and not self.MousePressed and x >= self.WaifuPos["x"] and y >= self.WaifuPos["y"] and x <= self.WaifuPos["x"] + self.WaifuPos["w"] and y <= self.WaifuPos["y"] + self.WaifuPos["h"] and currentShowingPage == "Settings" then
                self.MousePressed = true
                sound.PlayURL("http://files.m4tec.org/index.php/s/apjmfZ7AasncR8A/download", "", function(station)
                    if IsValid(station) then
                        station:SetVolume(1)
                        station:Play()
                    end
                end)
            elseif not input.IsMouseDown(MOUSE_LEFT) then
                self.MousePressed = false
            end
        end
        --Only support chromium, so using a fallback
        CloudMusic.Settings.LuoTianyi:SetHTML([[
            <body style="user-select:none;pointer-events:none;">
                <style>
                    .waifu {
                        position:absolute;
                        bottom:5px;
                        right:5px;
                        height:50%;
                        width:fit-content;
                    }
                    .waifu > span {
                        font-family:微软雅黑;
                        font-size:12px;
                        color:#66CCFF;
                        position:absolute;
                        left:50%;
                        bottom:100%;
                        text-align:center;
                        max-width:0;
                        transform:translate(-50%);
                        word-break:keep-all;
                        white-space:nowrap;
                        -webkit-transition:all 1s ease-in-out;
                        overflow:hidden;
                    }
                    .waifu > img {
                        max-height:100%;
                    }
                </style>
                <div class="waifu">
                    <span>作者的<strong>闺蜜</strong></span>
                    <img src="https://files.m4tec.org/index.php/s/8zJ3zwCLsW2MTia/preview" id="lty"/>
                </div>
                <script>
                    window.onmousedown = function() {return false;}
                    window.onkeydown = function() {return false;}
                    document.getElementById("lty").onerror = function(e) {
                        this.src = "http://penguin-logistics.cn/images/exusiai.png";
                    }
                    function reqWaifuPos() {
                        var el = document.getElementsByClassName("waifu")[0];
                        waifu.setWaifuPos(el.offsetLeft,el.offsetTop,el.clientWidth,el.clientHeight);
                    }
                    function showWaifu() {
                        var waifu = document.getElementsByClassName("waifu")[0];
                        var waifuText = waifu.querySelector("span");
                        waifuText.style.maxWidth = waifu.clientWidth + "px";
                    }
                    function hideWaifu() {
                        var waifu = document.getElementsByClassName("waifu")[0];
                        var waifuText = waifu.querySelector("span");
                        waifuText.style.maxWidth = "";
                    }
                </script>
            </body>
        ]])
        if file.Exists("materials/gwenskin/windows10.png", "GAME") then
            SetUISkin(CloudMusic)
            Print("Derma skin file detected, using CloudMusic Derma skin")
        end
        CloudMusic.Songs = {}
        local didPlayerPaused = false
        CloudMusic.Util = {
            ["AddHUDCustomCSSRule"] = function(css)
                Print("New CSS rule added to HUD")
                CloudMusic.HUD:RunJavascript("addCSS(\""..css:JavascriptSafe().."\");")
            end,
            ["ClearHUDCustomCSSRules"] = function()
                Print("All HUD CSS rule removed")
                CloudMusic.HUD:RunJavascript("removeAllCSS()");
            end,
            ["BeforeChannelForceStop"] = function()
                if IsValid(CloudMusic.CurrentChannel) then
                    didPlayerPaused = CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PAUSED and CloudMusic.CurrentChannel:GetState() ~= GMOD_CHANNEL_STOPPED
                end
            end,
            ["AfterChannelForceStop"] = function()
                if IsValid(CloudMusic.CurrentChannel) and not didPlayerPaused then
                    CloudMusic.CurrentChannel:Play()
                end
            end
        }
        CloudMusic.Playlists:SetVisible(false)
        CloudMusic:SetAlpha(0)
        CloudMusic:SetVisible(false)
        InitUserInfo()
        local lastShortcutKeyTime = 0
        hook.Add("PlayerSpawn","CloudMusic_PlayerSpawn",function()
            CloudMusic.Settings.Playerlist:SyncBlacklist()
            CloudMusic.Playlist:Sync()
        end)
        hook.Add("PreCleanupMap","CloudMusic_PreCleanup",function()
            CloudMusic.Util:BeforeChannelForceStop()
        end)
        hook.Add("PostCleanupMap", "CloudMusic_PostCleanup", function()
            CloudMusic.Util:AfterChannelForceStop()
        end)
        hook.Add("PlayerButtonDown", "CloudMusic_KeyPress", function(ply,btn)
            if SysTime() - lastShortcutKeyTime <= 0.5 then return end
            if input.IsButtonDown(KEY_LALT) then
                if input.IsButtonDown(KEY_DOWN) then
                    CloudMusic:Toggle()
                    lastShortcutKeyTime = SysTime()
                else
                    if not IsValid(CloudMusic.CurrentChannel) or not CloudMusic.CurrentPlaying then return end
                    if input.IsKeyDown(KEY_LEFT) then
                        CloudMusic:Prev()
                        lastShortcutKeyTime = SysTime()
                    elseif input.IsKeyDown(KEY_RIGHT) then
                        CloudMusic:Next()
                        lastShortcutKeyTime = SysTime()
                    elseif input.IsKeyDown(KEY_UP) then
                        if CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_PLAYING or CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STALLED then
                            CloudMusic.CurrentChannel:Pause()
                            lastShortcutKeyTime = SysTime()
                        else
                            CloudMusic.CurrentChannel:Play()
                            lastShortcutKeyTime = SysTime()
                        end
                    end
                end
            end
            if not playerNoticed then
                timer.Simple(math.Rand(2,10),function()
                    AddMessage(GetText("instruction"),GetText("cm_usable"))
                end)
                playerNoticed = true
            end
        end)
        hook.Add("PlayerStartVoice","CloudMusic_PlayerStartVoice",function()
            speaking = true
            for _,v in pairs(player.GetAll()) do
                if IsValid(v.CM_MusicChannel) then
                    v.CM_MusicChannel:SetVolume(v.CM_MusicChannel:GetVolume() * 0.5)
                end
            end
        end)
        hook.Add("PlayerEndVoice","CloudMusic_PlayerEndVoice",function()
            speaking = false
            for _,v in pairs(player.GetAll()) do
                if IsValid(v.CM_MusicChannel) then
                    v.CM_MusicChannel:SetVolume(v.CM_MusicChannelVolume)
                end
            end
        end)
        hook.Add("Think","CloudMusic_Think",function()
            if IsValid(CloudMusic.CurrentChannel) and CloudMusic.CurrentChannel:GetTime() >= CloudMusic.CurrentChannel:GetLength()-1 and CloudMusic.CurrentChannel:GetState() == GMOD_CHANNEL_STOPPED then
                SongEnded()
            end
            if IsValid(CloudMusic.CurrentChannel) then
                CloudMusic.CurrentChannel:SetVolume(CloudMusic.Volume * (speaking and 0.5 or 1))
            end
        end)
        timer.Create("CloudMusic_Update",0.15,0,function()
            for i=1,#channelPlayers do
                local p = channelPlayers[i]
                if p ~= nil and IsValid(p) and p ~= LocalPlayer() then
                    if IsValid(p.CM_MusicChannel) then
                        p.CM_MusicChannel:SetPos(p:GetPos())
                        if p:GetObserverMode() == OBS_MODE_NONE and p.CM_MusicChannel:GetState() == GMOD_CHANNEL_STOPPED and (p.CM_MusicChannelState == GMOD_CHANNEL_PLAYING or p.CM_MusicChannelState == GMOD_CHANNEL_STALLED) then
                            p.CM_MusicChannel:Play()
                            if p.CM_MusicChannelForcedStop then
                                p.CM_MusicChannelForcedStop = false
                                net.Start("CloudMusicReqSync")
                                net.SendToServer()
                            end
                        elseif p:GetObserverMode() ~= OBS_MODE_NONE then
                            p.CM_MusicChannel:Pause()
                            p.CM_MusicChannelForcedStop = true
                        end
                    else
                        table.remove(channelPlayers, i)
                    end
                elseif p ~= nil and not IsValid(p) then
                    if IsValid(p.CM_MusicChannel) then
                        p.CM_MusicChannel:Stop()
                        p.CM_MusicChannel = nil
                    end
                    table.remove(channelPlayers, i)
                end
            end
            if CloudMusic.HUD.CMUpdate then
                CloudMusic.HUD:CMUpdate()
            end
        end)
        timer.Start("CloudMusic_Update")
        cvars.AddChangeCallback("gmod_language", function(name,old,new)
            Print("User language changed, updating user interface...")
            LanguageUpdate()
        end,"CloudMusicLanguageDetect")
        net.Receive("ToggleCloudMusic", function()CloudMusic:Toggle()end)
        net.Receive("CloudMusic3DSync",function(len,ply)
            if GetSettings("CloudMusicBypass3D") then return end
            local p = net.ReadEntity()
            local valid = net.ReadBool()
            local state = net.ReadInt(32)
            local volume = net.ReadFloat()
            local id = net.ReadString()
            local time = net.ReadFloat()
            if p == LocalPlayer() or not IsValid(p) then return end
            for _,v in pairs(CloudMusic.Settings.Playerlist.BlacklistUsers) do
                if v.ID == p:SteamID64() then
                    Print("3D Play of "..p:Nick().." has been blocked")
                    return
                end
            end
            if valid then
                p.CM_MusicChannelState = state
                p.CM_MusicChannelVolume = volume
                if not IsValid(p.CM_MusicChannel) then
                    Create3DChannel(id,p)
                else
                    if p.CM_MusicChannelID ~= id then
                        p.CM_MusicChannel:Stop()
                        p.CM_MusicChannel = nil
                        Create3DChannel(id,p)
                    else
                        if state == GMOD_CHANNEL_PAUSED then
                            p.CM_MusicChannel:Pause()
                        elseif state == GMOD_CHANNEL_STOPPED then
                            p.CM_MusicChannel:Stop()
                        elseif state == GMOD_CHANNEL_PLAYING or state == GMOD_CHANNEL_STALLED then
                            if p.CM_MusicChannel:GetState() ~= GMOD_CHANNEL_PLAYING and p.CM_MusicChannel:GetState() ~= GMOD_CHANNEL_STALLED and p:GetObserverMode() == OBS_MODE_NONE then p.CM_MusicChannel:Play() end
                            p.CM_MusicChannel:SetVolume(volume * (speaking and 0.5 or 1))
                            p.CM_MusicChannel:SetTime(time)
                        end
                    end
                end
            elseif IsValid(p.CM_MusicChannel) then
                p.CM_MusicChannel:Stop()
                p.CM_MusicChannel = nil
            end
        end)
        net.Receive("CloudMusicInitPlayer", function()
            local p = net.ReadEntity()
            if p == LocalPlayer() or not IsValid(p) then return end
            p.CM_MusicInfo = {
                ["Status"] = CM_STATUS_NON_INFO,
                ["Name"] = nil,
                ["Artists"] = nil,
                ["Album"] = nil,
                ["Thumbnail"] = nil,
            }
        end)
        net.Receive("CloudMusicInfo", function()
            local p = net.ReadEntity()
            local info = net.ReadTable()
            if not IsValid(p) then return end
            p.CM_MusicInfo = info
            if IsValid(CloudMusic.PlayerInfo) then CloudMusic.PlayerInfo:UpdateInfo() end
        end)
        net.Receive("CloudMusicReqInfo", function()
            SendInfoData()
        end)
        net.Receive("CloudMusicDisconnect", function()
            local p = net.ReadEntity()
            if IsValid(p.CM_MusicChannel) then
                p.CM_MusicChannel:Stop()
                p.CM_MusicChannel = nil
            end
        end)
        net.Start("CloudMusicReqInfo")
        net.SendToServer()
        hook.Run("CloudMusicInit")
        Print("Clientside CloudMusic initialized!")
        CloudMusicInitOnce = true
        --timer.Create("CloudMusic_VersionChecker",360,0,CheckVersion)
        --timer.Start("CloudMusic_VersionChecker")
        --CheckVersion()
    end
    hook.Add("InitPostEntity", "CloudMusic_Init", Init)
    concommand.Add("cloudmusic", function()
        Print("Opening CloudMusic window...")
        CloudMusic:Toggle()
    end, nil, "打开网易云播放器")
    concommand.Add("cloudmusic_reinit",function()
        Print("Re-initialize CloudMusic...")
        Init()
    end, nil, "重新初始化网易云播放器")
    CreateClientConVar("cloudmusic_ui_debug", "0", false, false, "启用网易云播放器界面调试模式")
    if CloudMusicInitOnce then
        Print("WARN: Re-initialize may cause some problems, sometimes type 'stopsound' command in console may solve them.")
        Print("Old CloudMusic instance detected, doing re-initialize immediately")
        Init()
    end
end
if SERVER then
    print("===========================\n")
    print("    Cloud Music for LUA    \n")
    print("         By  Texas         \n")
    print("===========================")
    Print("Initializing serverside CloudMusic "..CLOUDMUSIC_VER)
    local function Init()
        util.AddNetworkString("ToggleCloudMusic")
        util.AddNetworkString("CloudMusicKeyDown")
        util.AddNetworkString("CloudMusic3DSync")
        util.AddNetworkString("CloudMusicReqSync")
        util.AddNetworkString("CloudMusicInitPlayer")
        util.AddNetworkString("CloudMusicInfo")
        util.AddNetworkString("CloudMusicReqInfo")
        util.AddNetworkString("CloudMusicDisconnect")
        if not CloudMusicRegisteredULib and ULib ~= nil then
            CloudMusicRegisteredULib = true
            ULib.ucl.registerAccess("cloudmusic3d","user","允许玩家使用3D外放功能","网易云音乐")
        end
        Print("Serverside CloudMusic initialized!")
    end
    local lastReqInfoTime = 0
    hook.Add("PlayerSpawn", "CloudMusic_PlayerSpawn", function()
        net.Start("CloudMusicReqSync")
        net.Broadcast()
    end)
    hook.Add("PlayerInitialSpawn", "CloudMusic_PlayerInitialSpawn", function(ply)
        net.Start("CloudMusicInitPlayer")
        net.WriteEntity(ply)
        net.Broadcast()
    end)
    hook.Add("PlayerSay","CloudMusic_PlayerSay",function(ply,text,team,dead)
        if string.lower(text) == "!cloudmusic" or string.lower(text) == "!cm" then
            net.Start("ToggleCloudMusic")
            net.Send(ply)
            return ""
        end
    end)
    hook.Add("PlayerDisconnected","CloudMusic_PlayerDisconnected",function(ply)
        net.Start("CloudMusicDisconnect")
        net.WriteEntity(ply)
        net.Broadcast()
    end)
    net.Receive("CloudMusicReqSync", function()
        net.Start("CloudMusicReqSync")
        net.Broadcast()
    end)
    net.Receive("CloudMusic3DSync", function(_,ply)
        local valid = net.ReadBool()
        local state = net.ReadInt(32)
        local volume = net.ReadFloat()
        local id = net.ReadString()
        local time = net.ReadFloat()
        if ULib ~= nil and not ULib.ucl.query(ply,"cloudmusic3d") and valid then return end
        if volume > 1 then volume = 1 end
        net.Start("CloudMusic3DSync")
        net.WriteEntity(ply)
        net.WriteBool(valid)
        net.WriteInt(state, 32)
        net.WriteFloat(volume)
        net.WriteString(id)
        net.WriteFloat(time)
        net.Broadcast()
    end)
    net.Receive("CloudMusicInfo", function(_,ply)
        local data = {
            ["Status"] = CM_STATUS_NON_INFO,
            ["Name"] = nil,
            ["Artists"] = nil,
            ["Album"] = nil,
            ["Thumbnail"] = nil,
        }
        data["Status"] = net.ReadInt(32)
        local name = net.ReadString()
        local artists = net.ReadString()
        local album = net.ReadString()
        local thumbnail = net.ReadString()
        if data["Status"] ~= CM_STATUS_NON_INFO then
            data["Name"] = name
            data["Artists"] = artists
            data["Album"] = album
            data["Thumbnail"] = thumbnail
        end
        net.Start("CloudMusicInfo")
        net.WriteEntity(ply)
        net.WriteTable(data)
        net.Broadcast()
    end)
    net.Receive("CloudMusicReqInfo", function()
        if os.time() - lastReqInfoTime <= 10 then return end
        net.Start("CloudMusicReqInfo")
        net.Broadcast()
        lastReqInfoTime = os.time()
    end)
    if file.Exists("materials/gwenskin/windows10.png", "GAME") then
        resource.AddSingleFile("materials/gwenskin/windows10.png")
        Print("Derma skin resource detected in server, using server skin file")
    else
        resource.AddWorkshop(1800442580)
        Print("Derma skin resource doesn't exists in server, using Steam Workshop")
    end
    Init()
end