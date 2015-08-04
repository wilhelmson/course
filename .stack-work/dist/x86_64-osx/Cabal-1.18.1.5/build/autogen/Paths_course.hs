module Paths_course (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,3], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jessewilliamson/Projects/nicta-course/course/.stack-work/install/x86_64-osx/lts-2.20/7.8.4/bin"
libdir     = "/Users/jessewilliamson/Projects/nicta-course/course/.stack-work/install/x86_64-osx/lts-2.20/7.8.4/lib/x86_64-osx-ghc-7.8.4/course-0.1.3"
datadir    = "/Users/jessewilliamson/Projects/nicta-course/course/.stack-work/install/x86_64-osx/lts-2.20/7.8.4/share/x86_64-osx-ghc-7.8.4/course-0.1.3"
libexecdir = "/Users/jessewilliamson/.cabal/libexec"
sysconfdir = "/Users/jessewilliamson/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "course_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "course_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "course_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "course_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "course_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)