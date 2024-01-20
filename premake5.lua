project "imgui-node-editor"
	kind "StaticLib"
	language "C++"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"*.h",
		"*.inl",
		"*.cpp",

		"%{IncludeDirs.imnodes}/examples/blueprints-example/utilities/**.h",
		"%{IncludeDirs.imnodes}/examples/blueprints-example/utilities/**.cpp",

        "%{IncludeDirs.imnodes}/examples/application/source/application.cpp",
        "%{IncludeDirs.imnodes}/examples/application/source/entry_point.cpp",
	}

    includedirs
	{
		"%{IncludeDirs.imnodes}",
		"%{IncludeDirs.imnodes}/examples/application/include",
		"%{IncludeDirs.stbi}",
		"%{IncludeDirs.imgui}",
	}

    --defines { "IMGUI_DEFINE_MATH_OPERATORS" }

    links { "ImGui" }

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"
	filter "configurations:Debug"
        runtime "Debug"
        symbols "on"
    filter "configurations:Release"
		runtime "Release"
		optimize "on"