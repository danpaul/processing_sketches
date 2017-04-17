import processing.sound.*;
import ddf.minim.*;

Minim minim;

// for recording
AudioInput minIn;
AudioRecorder recorder;
boolean recorded;

AudioIn in;
Reverb reverb;

void setup() {
  size(640,360);
  background(255);







  minim = new Minim(this);
  
  // get a stereo line-in: sample buffer length of 2048
  // default sample rate is 44100, default bit depth is 16
  minIn = minim.getLineIn(Minim.STEREO, 2048);
  
  // create an AudioRecorder that will record from in to the filename specified.
  // the file will be located in the sketch's main folder.
  recorder = minim.createRecorder(minIn, "myrecording.wav");
  
  // get an output we can playback the recording on
  //out = minim.getLineOut( Minim.STEREO );
  
  textFont(createFont("Arial", 12));








  // create the input stream
  in = new AudioIn(this, 0);
    
  // create a reverb effect
  reverb = new Reverb(this);
    
  // start the input stream
  in.play();
  reverb.process(in);
  
  
  recorder = minim.createRecorder(minIn, "myrecording.wav");
}      

void draw() {
  
  
    if ( recorder.isRecording() )
  {
    text("Now recording, press the r key to stop recording.", 5, 15);
  }
  else if ( !recorded )
  {
    text("Press the r key to start recording.", 5, 15);
  }
  else
  {
    text("Press the s key to save the recording to disk and play it back in the sketch.", 5, 15);
  }
  
  
  
}




void keyReleased()
{
  if ( !recorded && key == 'r' ) 
  {
    // to indicate that you want to start or stop capturing audio data, 
    // you must callstartRecording() and stopRecording() on the AudioRecorder object. 
    // You can start and stop as many times as you like, the audio data will 
    // be appended to the end of to the end of the file. 
    if ( recorder.isRecording() ) 
    {
      print("ending recording");
      recorder.endRecord();
      recorded = true;
    }
    else 
    {
      print("starting recording");
      recorder.beginRecord();
    }
  }
  if ( recorded && key == 's' )
  {
    // we've filled the file out buffer, 
    // now write it to a file of the type we specified in setup
    // in the case of buffered recording, 
    // this will appear to freeze the sketch for sometime, if the buffer is large
    // in the case of streamed recording, 
    // it will not freeze as the data is already in the file and all that is being done
    // is closing the file.
    // save returns the recorded audio in an AudioRecordingStream, 
    // which we can then play with a FilePlayer
    //if ( player != null )
    //{
    //    //player.unpatch( out );
    //    //player.close();
    //}
    //player = new FilePlayer( recorder.save() );
    //player.patch( out );
    //player.play();
  }
}