#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/ChromeBooksmarksSyncAdapter.apk
app/CloudPrint2.apk
app/Gmail.apk
app/GoogleCalendarSyncAdapter.apk
app/GoogleContactsSyncAdapter.apk
app/GoogleEars.apk
app/Hangouts.apk
app/Music.apk
app/YouTube.apk
etc/g.prop
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/com.google.widevine.software.drm.xml
etc/permissions/features.xml
etc/preferred-apps/google.xml
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
framework/com.google.widevine.software.drm.jar
lib/libAppDataSearch.so
lib/libdocscanner_image-v7a.so
lib/libdocsimageutils.so
lib/libearthandroid.so
lib/libearthmobile.so
lib/libfilterpack_facedetect.so
lib/libgames_rtmp_jni.so
lib/libgoogle_recognizer_jni_l.so
lib/libjni_t13n_shared_engine.so
lib/liblinearalloc.so
lib/libndk1.so
lib/libocrclient.so
lib/libpatts_engine_jni_api.so
lib/librectifier-v7a.so
lib/librsjni.so
lib/libspeexwrapper.so
lib/libstlport_shared.so
lib/libvcdecoder_jni.so
lib/libvideochat_jni.so
lib/libvorbisencoder.so
lib/libwebrtc_audio_coding.so
lib/libwebrtc_audio_preprocessing.so
lib/libWVphoneAPI.so
priv-app/GoogleBackupTransport.apk
priv-app/GoogleFeedback.apk
priv-app/GoogleLoginService.apk
priv-app/GoogleOneTimeInitializer.apk
priv-app/GooglePartnerSetup.apk
priv-app/GoogleServicesFramework.apk
priv-app/Phonesky.apk
priv-app/PrebuiltGmsCore.apk
priv-app/SetupWizard.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
