Valentine = function(step) {
  if ( ! Detector.webgl ) Detector.addGetWebGLMessage();

  step = step || function() {};
  var renderer, scene, camera;

  var particleSystem, uniforms, geometry;

  var particles = 7500;
  var lastFrameTime = Date.now();
  var elapsedTime = 0;

  var WIDTH = window.innerWidth;
  var HEIGHT = window.innerHeight;

  init();
  animate();

  function init() {

    camera = new THREE.PerspectiveCamera( 40, WIDTH / HEIGHT, 1, 10000 );
    camera.position.z = 300;

    scene = new THREE.Scene();

    var attributes = {

      size:        { type: 'f', value: null },
      customColor: { type: 'c', value: null }

    };

    uniforms = {

      color:     { type: "c", value: new THREE.Color( 0xff0000 ) },
      texture:   { type: "t", value: THREE.ImageUtils.loadTexture( "images/heart.png" ) }

    };

    var shaderMaterial = new THREE.ShaderMaterial( {

      uniforms:       uniforms,
      attributes:     attributes,
      vertexShader:   document.getElementById( 'vertexshader' ).textContent,
      fragmentShader: document.getElementById( 'fragmentshader' ).textContent,

      blending:       THREE.AdditiveBlending,
      depthTest:      false,
      transparent:    true

    });


    var radius = 220;

    geometry = new THREE.BufferGeometry();

    var positions = new Float32Array( particles * 3 );
    var values_color = new Float32Array( particles * 3 );
    var values_size = new Float32Array( particles );

    var color = new THREE.Color();

    for( var v = 0; v < particles; v++ ) {

      values_size[ v ] = 20;

      positions[ v * 3 + 0 ] = ( Math.random() * 2 - 1 ) * radius;
      positions[ v * 3 + 1 ] = ( Math.random() * 2 - 1 ) * radius;
      positions[ v * 3 + 2 ] = ( Math.random() * 2 - 1 ) * radius;

      color.setHSL( v / particles, 1.0, 0.5 );

      values_color[ v * 3 + 0 ] = color.r;
      values_color[ v * 3 + 1 ] = color.g;
      values_color[ v * 3 + 2 ] = color.b;

    }

    geometry.addAttribute( 'position', new THREE.BufferAttribute( positions, 3 ) );
    geometry.addAttribute( 'customColor', new THREE.BufferAttribute( values_color, 3 ) );
    geometry.addAttribute( 'size', new THREE.BufferAttribute( values_size, 1 ) );

    particleSystem = new THREE.PointCloud( geometry, shaderMaterial );

    scene.add( particleSystem );

    renderer = new THREE.WebGLRenderer();
    renderer.setPixelRatio( window.devicePixelRatio );
    renderer.setSize( WIDTH, HEIGHT );

    var container = document.getElementById( 'container' );
    container.appendChild( renderer.domElement );

    window.addEventListener( 'resize', onWindowResize, false );

  }

  function onWindowResize() {

    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();

    renderer.setSize( window.innerWidth, window.innerHeight );

  }

  function animate() {

    requestAnimationFrame( animate );

    render();

  }

  function render() {

    var now = Date.now();
    var time = now * 0.005;

    particleSystem.rotation.z = 0.01 * time;

    var size = geometry.attributes.size.array;

    for( var i = 0; i < particles; i++ ) {

      size[ i ] = 40 * ( 1 + Math.sin( 0.1 * i + time ) );

    }

    geometry.attributes.size.needsUpdate = true;

    renderer.render( scene, camera );

    var dt = (now - lastFrameTime) / 1000;
    elapsedTime += dt;
    step(elapsedTime, dt);
    lastFrameTime = now;
  }
}
