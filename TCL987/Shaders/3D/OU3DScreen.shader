// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TCL987/3D/Over-Under"
{
	Properties
	{
		_ScreenTexture("Screen Texture", 2D) = "white" {}
		[Toggle(_)]_SwapEyes("Swap-Eyes", Int) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.5
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 vertexToFrag62;
		};

		uniform sampler2D _ScreenTexture;
		uniform int _SwapEyes;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 temp_cast_0 = (0.5).xx;
			float2 temp_cast_1 = (0.5).xx;
			float2 uv_TexCoord37 = v.texcoord.xy * temp_cast_0 + temp_cast_1;
			float2 temp_cast_2 = (0.5).xx;
			float2 temp_cast_3 = (0.0).xx;
			float2 uv_TexCoord36 = v.texcoord.xy * temp_cast_2 + temp_cast_3;
			float localStereoEyeIndex63 = ( unity_StereoEyeIndex );
			float lerpResult67 = lerp( localStereoEyeIndex63 , ( -localStereoEyeIndex63 + 1.0 ) , (float)_SwapEyes);
			float lerpResult34 = lerp( uv_TexCoord37.y , uv_TexCoord36.y , lerpResult67);
			float2 appendResult53 = (float2(v.texcoord.xy.x , lerpResult34));
			o.vertexToFrag62 = appendResult53;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Emission = tex2D( _ScreenTexture, i.vertexToFrag62 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
3919;770;1493;698;1410.59;-191.384;1.310187;True;True
Node;AmplifyShaderEditor.CustomExpressionNode;63;-967.0054,562.1035;Float;False;unity_StereoEyeIndex;1;False;0;StereoEyeIndex;True;False;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;64;-756.9037,653.6202;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;65;-577.5376,751.5209;Float;False;Property;_SwapEyes;Swap-Eyes;1;0;Create;True;0;0;False;1;Toggle(_);0;0;0;1;INT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;66;-578.904,653.6202;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-824.2,163.4997;Float;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-827.4974,335.0994;Float;False;Constant;_Float2;Float 2;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-828.5983,415.4;Float;False;Constant;_Float3;Float 3;1;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-826.3977,250.4;Float;False;Constant;_Float1;Float 1;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;67;-300.994,563.3737;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;36;-427.407,343.5999;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;37;-429.1076,190.5996;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;10;75.70391,-90.59937;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;34;-4.10711,374.1992;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;53;349.4921,86.00162;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.VertexToFragmentNode;62;505.8018,72.80847;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;8;757.0021,-29.09985;Float;True;Property;_ScreenTexture;Screen Texture;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1147.804,-26.60001;Float;False;True;3;Float;ASEMaterialInspector;0;0;Unlit;TCL987/3D/Over-Under;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;4;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;1;False;-1;1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;64;0;63;0
WireConnection;66;0;64;0
WireConnection;67;0;63;0
WireConnection;67;1;66;0
WireConnection;67;2;65;0
WireConnection;36;0;40;0
WireConnection;36;1;41;0
WireConnection;37;0;38;0
WireConnection;37;1;39;0
WireConnection;34;0;37;2
WireConnection;34;1;36;2
WireConnection;34;2;67;0
WireConnection;53;0;10;1
WireConnection;53;1;34;0
WireConnection;62;0;53;0
WireConnection;8;1;62;0
WireConnection;0;2;8;0
ASEEND*/
//CHKSM=A875FCDE7F1D05794CC87A23ABDBF0BFF8A336C9