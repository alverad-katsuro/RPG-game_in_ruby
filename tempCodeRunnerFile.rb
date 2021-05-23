def reload_cloud_med!
    if @objects[:clouds_med].clip_x == (@objects[:clouds_med].clip_width)
        @objects[:clouds_med].clip_x = 0
    end
end
@objects[:clouds_med].clip_x += 1