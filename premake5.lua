project "SDLImage"
	kind "SharedLib"
	language "C"
	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/*.h",
		"src/*.c"
	}

	includedirs
	{
		"include",
		"%{wks.location}/gerald/vendor/SDL/include"
	}

	libdirs
	{
		"%{wks.location}/gerald/vendor/SDL/build"
	}

	links
	{
		"SDL3"
	}

	filter "configurations:Debug"
		defines "DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "NDEBUG"
		runtime "Release"
		optimize "on"
