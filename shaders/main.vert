attribute vec3  position;
attribute vec4  color;
attribute float size;

uniform   vec2  mouse;
uniform   vec2  resolution;
uniform   int   backgroundSize;

varying   vec4  vColor;
varying vec3 vPosition;

void main()
{
    // アスペクト比を求め、座標を変換
    float aspect = 1.0 / (resolution.x / resolution.y);
    vec3 a = vec3(1.);
    if(backgroundSize == 0) {
        a = vec3(min(aspect, 1.), min(1. / aspect, 1.), 1.0);
    } else {
        a = vec3(max(aspect, 1.), max(1. / aspect, 1.), 1.0);
    }
    vec3 p = position * a;
    vec3 m = vec3(mouse, 0.0);

    // マウスカーソルと頂点位置との相対関係から距離などを求める
    vec3 v = p - m;
    vec3 n = normalize(v) * a;
    float l = length(v / a);
    l = 1.0 - smoothstep(0.0, 0.5, l);

    // 求めた距離や位置関係を使って頂点を動かしたり、サイズを変えたり……
    // gl_Position = vec4(p + n * l * 0.1, 1.0);
    gl_Position = vec4(p, 1.0);
    gl_PointSize = size * l * 2.0;
    gl_PointSize = 8.;

    vColor = color;
    vPosition = position;
}
