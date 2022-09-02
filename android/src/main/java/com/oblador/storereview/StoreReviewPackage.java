package com.oblador.storereview;

import androidx.annotation.Nullable;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.module.model.ReactModuleInfo;
import com.facebook.react.module.model.ReactModuleInfoProvider;
import com.facebook.react.TurboReactPackage;
import com.facebook.react.uimanager.ViewManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class StoreReviewPackage extends TurboReactPackage {

    @Nullable
    @Override
    public NativeModule getModule(String name, ReactApplicationContext reactContext) {
        if (name.equals(StoreReviewModuleImpl.NAME)) {
            return new StoreReviewModule(reactContext);
        } else {
            return null;
        }
    }

    @Override
    public ReactModuleInfoProvider getReactModuleInfoProvider() {
        return () -> {
            final Map<String, ReactModuleInfo> moduleInfos = new HashMap<>();
            boolean isTurboModule = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED;
            moduleInfos.put(
                    StoreReviewModuleImpl.NAME,
                    new ReactModuleInfo(
                            StoreReviewModuleImpl.NAME,
                            StoreReviewModuleImpl.NAME,
                            false, // canOverrideExistingModule
                            false, // needsEagerInit
                            true, // hasConstants
                            false, // isCxxModule
                            isTurboModule // isTurboModule
            ));
            return moduleInfos;
        };
    }
}
